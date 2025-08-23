import 'package:farm_thoughts_web_app/features/delivery_agent/provider/delivery_agents_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension ProviderExtension on BuildContext {
  // Delivery Agents read provider
  DeliveryAgentsProvider get readDeliveryAgentsProvider =>
      read<DeliveryAgentsProvider>();

  // Delivery Agents watch provider
  DeliveryAgentsProvider get watchDeliveryAgentProvider =>
      watch<DeliveryAgentsProvider>();
}
