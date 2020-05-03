import 'package:dusty_quiche/src/bindings.dart';
import 'package:dusty_quiche/src/constants.dart';

void main() {
  print("Libquiche version ${quiche_version()}");

  final http3config = quiche_h3_config_new();
  print(http3config.max_header_list_size);

  final config = quiche_config_new(QUICHE_PROTOCOL_VERSION);
  quiche_config_set_max_idle_timeout(config, 5000);
  quiche_config_set_cc_algorithm(http3config, QuicheCCAlgorithm.cc_reno);
}
