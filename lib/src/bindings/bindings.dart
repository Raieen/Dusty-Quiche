import 'dart:convert';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../libquiche.dart';
import '../utils/ffi_extentions.dart';

// Load Quiche

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

