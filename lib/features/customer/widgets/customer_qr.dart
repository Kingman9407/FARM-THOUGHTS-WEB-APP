import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../commons/widgets/k_cached_network_profile_image.dart';
import '../../../core/theme/app_colors.dart';

class CustomerQr extends StatefulWidget {
  const CustomerQr({super.key});

  @override
  State<CustomerQr> createState() => _CustomerQrState();
}

class _CustomerQrState extends State<CustomerQr> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () { context.readCustomerProvider.ResetAll();}, icon:Icon(Icons.arrow_back)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Done'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: context.screenWidth * 0.02),
              child: Text("Generated QR Code",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
            )

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KCachedNetworkProfileImage(
              imageUrl:
              "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              height: context.screenWidth * 0.04,
              width: context.screenWidth * 0.04,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05,vertical:  context.screenHeight * 0.04),
                  child: SizedBox(

                    width:  200,
                    child: PrettyQrView.data(
                      data:'https://farmthoughts.in/',
                    ),
                  ),
                )

            )
    ],

        )
      ],

    );
  }
}
