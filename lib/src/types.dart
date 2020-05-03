// Structs
import 'dart:ffi';

import 'package:ffi/ffi.dart';

class Config extends Struct {
  // TODO: Dig into this
}

class Http3Config extends Struct {
  @Uint64()
  int max_header_list_size; // These are actually Options in rust, so null = 0 and something = 1
  // I need to figure out how to do option.unwrap here...
  // Do I re-implement this?
  // https://github.com/rust-lang/rust/blob/45c7838089576552391237bb41cdd3d46582d3e5/src/libcore/option.rs#L167

  @Uint64()
  int qpack_max_table_capacity;

  @Uint64()
  int qpack_blocked_streams;

  factory Http3Config.allocate(int max_header_list_size,
          int qpack_max_table_capacity, int qpack_blocked_streams) =>
      allocate<Http3Config>().ref
        ..max_header_list_size = max_header_list_size
        ..qpack_max_table_capacity = qpack_max_table_capacity
        ..qpack_blocked_streams = qpack_blocked_streams;
}

abstract class QuicheCCAlgorithm {
  static const int cc_reno = 0;
  static const int cc_cubic = 1;
}
