# Dusty Quiche

Dusty Quiche brings [quiche](https://github.com/cloudflare/quiche) to Dart. It makes heavy use of [Foreign Function Interface](https://dart.dev/guides/libraries/c-interop) to call the [native C quiche API](https://github.com/cloudflare/quiche/blob/master/include/quiche.h).

Dusty Quiche allows you to call native quiche functions from your dart code. This can be used for HTTP/3 servers and clients.

## What is Quiche?

Dusty Quiche is for us http/3 quic nerds

## Installation

```dart
// TODO: This
```

## Usage

```dart
// TODO: This
```

### HTTP/3

```dart
// TODO: This
```

## Examples

```dart
// TODO: This
```

## Misc

docker build -t quiche -f Docker/Dockerfile .

docker run -v quiche:/src/quiche -d --name quiche quiche

docker cp quiche:/src/quiche/examples/build/debug/libquiche.so ./bin/libquiche.so

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
