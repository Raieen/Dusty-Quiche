import 'dart:ffi';

import 'bindings/quiche_bindings.g.dart' as quiche_bindings;

const libquichePath = "./libquiche.so";

void main() {
  final quicheBindings =
      quiche_bindings.NativeLibrary(DynamicLibrary.open(libquichePath));
  print("Quiche Version ${quicheBindings.quiche_version().value}");
}
