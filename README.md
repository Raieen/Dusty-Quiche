# Dusty Quiche

Using Dart & Quiche.

Makes heavy use of [ffi](https://api.dart.dev/stable/2.8.1/dart-ffi/dart-ffi-library.html).

Quiche is for us http/3 quic nerds

https://github.com/cloudflare/quiche

docker build -t quiche -f Docker/Dockerfile .

docker run -v quiche:/src/quiche -d --name quiche quiche

## Instructions

- docker exec -it quiche bash

- cargo build

- Copy libquiche.so to bin/libquiche.so

## Results

```
dart ffi_dart.dart
Libquiche version 0.3.0
```


# TODO

implementation https://github.com/cloudflare/quiche/blob/master/include/quiche.h

tests

lint (dartanalyzer --options analysis_options.yaml .)
