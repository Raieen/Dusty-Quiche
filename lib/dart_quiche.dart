import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'utils/ffi_extentions.dart';

// Load Quiche
DynamicLibrary libquiche = DynamicLibrary.open("./bin/libquiche.so");

void main() {
  print("Libquiche version ${quiche_version()}");
}

// ignore: non_constant_identifier_names
String quiche_version() {
  return libquiche.lookupFunction<_quiche_version_c, _quiche_version_dart>("quiche_version").nativeString();
}

typedef _quiche_version_c = Pointer<Utf8> Function();
typedef _quiche_version_dart = Pointer<Utf8> Function();