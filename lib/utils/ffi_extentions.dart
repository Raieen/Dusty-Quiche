import 'dart:ffi';
import 'package:ffi/ffi.dart';

extension ToString on Pointer<Utf8> Function() {
  String nativeString() {
    return Utf8.fromUtf8(this());
  }
}
