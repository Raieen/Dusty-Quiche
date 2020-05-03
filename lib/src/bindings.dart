import 'dart:convert';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:dusty_quiche/src/types.dart';
import 'package:ffi_dart/src/types.dart';

import 'utils/ffi_extentions.dart';

// Load Quiche
DynamicLibrary libquiche = DynamicLibrary.open("./bin/libquiche.so");

// quiche_version
typedef _quiche_version_c = Pointer<Utf8> Function();
typedef _quiche_version_dart = Pointer<Utf8> Function();

// ignore: non_constant_identifier_names
String quiche_version() {
  return libquiche
      .lookupFunction<_quiche_version_c, _quiche_version_dart>("quiche_version")
      .nativeString();
}

// TODO: Reference https://github.com/dart-lang/sdk/issues/37301
int quiche_enable_debug_logging() {}

// quiche_config_new

typedef _quiche_config_new_c = Pointer<Config> Function(Uint32);
typedef _quiche_config_new_dart = Pointer<Config> Function(int);

// 0xbabababa
Config quiche_config_new(int version) {
  return libquiche
      .lookupFunction<_quiche_config_new_c, _quiche_config_new_dart>(
          "quiche_config_new")(version)
      .ref;
}

// quiche_config_set_application_protos

typedef _quiche_config_set_application_protos_c = Uint8 Function(
    Pointer<Config>, Pointer<Utf8>, Uint8);
typedef _quiche_config_set_application_protos_dart = int Function(
    Pointer<Config>, Pointer<Utf8>, int);

int quiche_config_set_application_protos(Config config, String protos) {
  // Calculate byte length of protos
  final length = utf8.encode(protos).length;
  return libquiche.lookupFunction<_quiche_config_set_application_protos_c,
              _quiche_config_set_application_protos_dart>(
          "quiche_config_set_application_protos")(
      config.addressOf, Utf8.toUtf8(protos), length);
}

// quiche_config_set_max_idle_timeout

typedef _quiche_config_set_max_idle_timeout_c = Void Function(
    Pointer<Config> config, Uint64 value);
typedef _quiche_config_set_max_idle_timeout_dart = void Function(
    Pointer<Config> config, int value);

void quiche_config_set_max_idle_timeout(Config config, int value) {
  libquiche.lookupFunction<_quiche_config_set_max_idle_timeout_c,
          _quiche_config_set_max_idle_timeout_dart>(
      "quiche_config_set_max_idle_timeout")(config.addressOf, value);
}

// quiche_config_set_max_packet_size

typedef _config_value_c = Void Function(Pointer<Config> config, Uint64 value);
typedef _config_value_dart = void Function(Pointer<Config> config, int value);

void quiche_config_set_max_packet_size(Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
      "quiche_config_set_max_packet_size")(config.addressOf, value);
}

// quiche_config_set_initial_max_data

void quiche_config_set_initial_max_data(Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
      "quiche_config_set_initial_max_data")(config.addressOf, value);
}

// quiche_config_set_initial_max_stream_data_bidi_local

void quiche_config_set_initial_max_stream_data_bidi_local(
    Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
          "quiche_config_set_initial_max_stream_data_bidi_local")(
      config.addressOf, value);
}

// quiche_config_set_initial_max_stream_data_bidi_remote

void quiche_config_set_initial_max_stream_data_bidi_remote(
    Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
          "quiche_config_set_initial_max_stream_data_bidi_remote")(
      config.addressOf, value);
}

// quiche_config_set_initial_max_stream_data_uni

void quiche_config_set_initial_max_stream_data_uni(Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
      "quiche_config_set_initial_max_stream_data_uni")(config.addressOf, value);
}

// quiche_config_set_initial_max_streams_bidi

void quiche_config_set_initial_max_streams_bidi(Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
      "quiche_config_set_initial_max_streams_bidi")(config.addressOf, value);
}

// quiche_config_set_initial_max_streams_uni

void quiche_config_set_initial_max_streams_uni(Config config, int value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
      "quiche_config_set_initial_max_streams_uni")(config.addressOf, value);
}

// quiche_config_set_disable_active_migration

typedef _quiche_config_set_disable_active_migration_c = Void Function(
    Pointer<Config> config, Int8 value);
typedef _quiche_config_set_disable_active_migration_dart = void Function(
    Pointer<Config> config, bool value);

void quiche_config_set_disable_active_migration(Config config, bool value) {
  libquiche.lookupFunction<_config_value_c, _config_value_dart>(
          "quiche_config_set_disable_active_migration")(
      config.addressOf, value == false ? 0 : 1);
}

// quiche_h3_config_new

typedef _quiche_h3_config_new_c = Pointer<Http3Config> Function();
typedef _quiche_h3_config_new_dart = Pointer<Http3Config> Function();

Http3Config quiche_h3_config_new() {
  return libquiche
      .lookupFunction<_quiche_h3_config_new_c, _quiche_h3_config_new_dart>(
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
      "quiche_config_set_cc_algorithm")(config.addressOf, algorithm);
}
