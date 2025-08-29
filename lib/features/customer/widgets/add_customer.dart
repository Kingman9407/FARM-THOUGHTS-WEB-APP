import 'package:flutter/material.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';

import '../../../core/theme/app_colors.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.arrow_back),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
    backgroundColor:  Colors.black,

    )



            )
          ],

        )
      ],
    );
  }
}
