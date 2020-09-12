# FFI Bindings

Generates [dart:ffi](https://dart.dev/guides/libraries/c-interop) bindings for the [Quiche C API](https://github.com/cloudflare/quiche/blob/master/include/quiche.h) using [ffigen](https://github.com/dart-lang/ffigen). These bindings allow the Quiche API to be called using Dart.

## Generating the bindings

You will need to have docker and docker-compose installed. Once those are installed, the bindings will be generated and quiche will be built from the master branch.

```bash
docker-compose up
```

After a few minutes, the generated ffi bindings, `quiche_bindings.g.dart` will be in `quiche-output/` along with the `libquiche.so`. These can be moved to the appropriate places to update Dusty Quiche with the latest ffi bindings.