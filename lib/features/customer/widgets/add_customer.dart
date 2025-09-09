import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: Text('Next'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
