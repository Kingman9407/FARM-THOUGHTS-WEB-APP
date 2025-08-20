import 'package:farm_thoughts_web_app/commons/widgets/k_delivery_entries_card.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:flutter/material.dart';

class DeliveryEntriesDashboard extends StatelessWidget {
  const DeliveryEntriesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: context.screenHeight / 9,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3,
                  maxCrossAxisExtent: context.screenWidth,
                ),
                itemCount: 20,
                itemBuilder: (cotext, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: KDeliveryEntriesCard(),
                  );
                },
              ),
            ),
            Expanded(flex: 1, child: Container(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
