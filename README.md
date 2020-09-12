# Dusty Quiche

Dusty Quiche brings [quiche](https://github.com/cloudflare/quiche) to Dart. It makes use of [Foreign Function Interface](https://dart.dev/guides/libraries/c-interop) to call the [native C quiche API](https://github.com/cloudflare/quiche/blob/master/include/quiche.h).

Dusty Quiche allows you to call native quiche functions from your dart code. This can be used for HTTP/3 servers and clients.

## What is Quiche?

Read up on Quiche in this Cloudflare [blog post](https://blog.cloudflare.com/enjoy-a-slice-of-quic-and-rust/).

*TLDR: Implementation of QUIC and HTTP/3.*

## Generating Bindings

See more instructions [here](tools/bindings) for generating the FFI bindings.

## Troubleshooting Guide

### Problem

```bash
Unhandled exception:
Invalid argument(s): Failed to load dynamic library (./libquiche.so: cannot open shared object file: No such file or directory)
#0      _open (dart:ffi-patch/ffi_dynamic_library_patch.dart:13:55)
#1      new DynamicLibrary.open (dart:ffi-patch/ffi_dynamic_library_patch.dart:22:12)
#2      main (package:dusty_quiche/version.dart:9:52)
#3      _startIsolate.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:301:19)
#4      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:168:12)
```

### Solution

`libquiche.so` can not be found, try again in the correct directory or move `libquiche.so` to the correct directory.

### Problem

```bash
Unhandled exception:
Invalid argument(s): Failed to load dynamic library (193)
#0      _open (dart:ffi-patch/ffi_dynamic_library_patch.dart:13:55)
#1      new DynamicLibrary.open (dart:ffi-patch/ffi_dynamic_library_patch.dart:22:12)
#2      libquiche (package:dusty_quiche/src/libquiche.dart:6:43)
#3      libquiche (package:dusty_quiche/src/libquiche.dart:6:16)
#4      quiche_version (package:dusty_quiche/src/bindings/bindings.dart:17:10)
#5      main (file:///E:/Development/Dart-Quiche-Dev/Dusty-Quiche/exp/Dusty-Quiche/bin/scratch.dart:9:30)
#6      _startIsolate.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:307:19)
#7      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:174:12)
```

### Solution

Looks like some Windows problem, running everything in a docker container with Dart installed works fine.

## Examples

### Quiche Version

Get the current version of Quiche

```dart
dart version.dart
Quiche Version 48
```

# Coming Soon

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