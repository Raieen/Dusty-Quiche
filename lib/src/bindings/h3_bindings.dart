
// quiche_h3_config_new

import 'dart:ffi';

import '../libquiche.dart';
import '../types.dart';

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