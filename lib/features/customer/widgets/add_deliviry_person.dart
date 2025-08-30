import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../commons/widgets/k_text_form_field.dart';


class AddDeliviryPerson extends StatefulWidget {
  const AddDeliviryPerson({super.key});

  @override
  State<AddDeliviryPerson> createState() => _AddDeliviryPersonState();
}

class _AddDeliviryPersonState extends State<AddDeliviryPerson> {
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
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Deliviery Person',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextField(

            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
            ),
          ),
        ),

      ],
    );
  }
}
