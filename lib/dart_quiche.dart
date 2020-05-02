import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'utils/ffi_extentions.dart';

// Load Quiche
DynamicLibrary libquiche = DynamicLibrary.open("./bin/libquiche.so");

void main() {
  print("Libquiche version ${quiche_version()}");

  final config = quiche_h3_config_new();

  // print(config.max_header_list_size);
  // print("0x${config.addressOf.address.toRadixString(16)}");
  // quiche_h3_config_set_max_header_list_size(config, 123);
  // print(config.max_header_list_size);
  quiche_config_set_cc_algorithm(config, QuicheCCAlgorithm.cc_reno);
}

// quiche_version

typedef _quiche_version_c = Pointer<Utf8> Function();
typedef _quiche_version_dart = Pointer<Utf8> Function();

// ignore: non_constant_identifier_names
String quiche_version() {
  return libquiche
      .lookupFunction<_quiche_version_c, _quiche_version_dart>("quiche_version")
      .nativeString();
}

// quiche_h3_config_new

typedef _quiche_h3_config_new_c = Pointer<Http3Config> Function();
typedef quiche_h3_config_new_dart = Pointer<Http3Config> Function();

Http3Config quiche_h3_config_new() {
  return libquiche
      .lookupFunction<_quiche_h3_config_new_c, quiche_h3_config_new_dart>(
          "quiche_h3_config_new")()
      .ref;
}

// quiche_h3_config_set_max_header_list_size

typedef quiche_h3_config_set_max_header_list_size_c = Void Function(
    Pointer<Http3Config>, Uint64);
typedef quiche_h3_config_set_max_header_list_size_dart = void Function(
    Pointer<Http3Config>, int);

// TODO: This will actually set correctly in rust but the Dart struct doesn't know about Rust options
void quiche_h3_config_set_max_header_list_size(Http3Config config, int value) {
  libquiche.lookupFunction<quiche_h3_config_set_max_header_list_size_c,
          quiche_h3_config_set_max_header_list_size_dart>(
      "quiche_h3_config_set_max_header_list_size")(config.addressOf, value);
}

// quiche_config_set_cc_algorithm

abstract class QuicheCCAlgorithm {
  static const int cc_reno = 0;
  static const int cc_cubic = 1;
}

typedef quiche_config_set_cc_algorithm_c = Void Function(
    Pointer<Http3Config>, Uint8);
typedef quiche_config_set_cc_algorithm_dart = void Function(
    Pointer<Http3Config>, int);

void quiche_config_set_cc_algorithm(Http3Config config, int algorithm) {
  if (algorithm != QuicheCCAlgorithm.cc_reno &&
      algorithm != QuicheCCAlgorithm.cc_cubic) {
    throw "Unsupported algorithm";
  }

  libquiche.lookupFunction<quiche_config_set_cc_algorithm_c,
              quiche_config_set_cc_algorithm_dart>(
          "quiche_config_set_cc_algorithm")(
      config.addressOf, algorithm);
}

class Http3Config extends Struct {
  @Uint64()
  int max_header_list_size; // These are actually Options in rust, so null = 0 and something = 1
  // I need to figure out how to do option.unwrap here...
  // Do I re-implement this?
  // https://github.com/rust-lang/rust/blob/45c7838089576552391237bb41cdd3d46582d3e5/src/libcore/option.rs#L167

  @Uint64()
  int qpack_max_table_capacity;

  @Uint64()
  int qpack_blocked_streams;

  factory Http3Config.allocate(int max_header_list_size,
          int qpack_max_table_capacity, int qpack_blocked_streams) =>
      allocate<Http3Config>().ref
        ..max_header_list_size = max_header_list_size
        ..qpack_max_table_capacity = qpack_max_table_capacity
        ..qpack_blocked_streams = qpack_blocked_streams;
}
