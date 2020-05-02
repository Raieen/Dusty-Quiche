import 'dart:ffi';

import 'package:ffi/ffi.dart';

typedef NativeRustVersionFunction = Pointer<Utf8> Function();
typedef NativeVersionFunction = Pointer<Utf8> Function();

main() {
  // Load Quiche
  DynamicLibrary libquiche = DynamicLibrary.open("./bin/libquiche.so");
  
  final quiche_version = libquiche.lookupFunction<NativeRustVersionFunction, NativeVersionFunction>("quiche_version");
  final version = quiche_version.nativeString();
  print("Libquiche version $version");
}

extension ToString on Pointer<Utf8> Function() {
  String nativeString() {
    return Utf8.fromUtf8(this());
  }
}