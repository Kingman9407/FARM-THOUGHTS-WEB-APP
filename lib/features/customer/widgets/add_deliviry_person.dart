import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../commons/widgets/k_cached_network_profile_image.dart';
import '../../../commons/widgets/k_text_form_field.dart';


class AddDeliveryPerson extends StatefulWidget {
  const AddDeliveryPerson({super.key});

  @override
  State<AddDeliveryPerson> createState() => _AddDeliviryPersonState();



}

class _AddDeliviryPersonState extends State<AddDeliveryPerson> {
  final TextEditingController _searchcontroller = TextEditingController();
  List<Map<String, String>> allDeliveryAgent = [
    {
      "name":"Aseem",
      "imageURL": "https://randomuser.me/api/portraits/men/32.jpg",
      "phone":"934512334"
    }
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () { context.readCustomerProvider.ResetAll();}, icon:Icon(Icons.arrow_back)),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: _searchcontroller,
                  decoration: const InputDecoration(

                    labelText: "Search Agents",
                    labelStyle: TextStyle(

                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    )
                  ),

                ),
              ),
            )
          ],
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allDeliveryAgent.length ,
                  itemBuilder: (context,index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12, top:12 ),
                    child: Row(
                      spacing: context.screenWidth * 0.008,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KCachedNetworkProfileImage(
                          imageUrl:
                          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          height: context.screenWidth * 0.03,
                          width: context.screenWidth * 0.03,
                        ),
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "aseem",
                              style: TextStyle(
                                fontSize: context.screenWidth * 0.01,
                                fontWeight: FontWeight.w600,
                                color: AppColors.titleColor,

                              ),

                            ),
                            Text(
                              "No: 16 Haji Hussain st",
                              style: TextStyle(
                                fontSize: context.screenWidth * 0.01,
                                fontWeight: FontWeight.w400,
                                color:AppColors.titleColor,

                              ),

                            )
                          ],
                        ),

                        ),

                       Padding(padding: EdgeInsets.all(6),
                         child: ElevatedButton(
                             onPressed: () {
                               context.readCustomerProvider.setQrEnable(
                                 true,
                               );
                             },
                             child: Text('add'),

                           style: ElevatedButton.styleFrom(
                             backgroundColor: AppColors.whiteColor,
                             foregroundColor: Colors.grey,
                             side: const BorderSide(color:Colors.grey, width: 1),
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(6),

                             ),
                           ),



                         ),
                       )

                      ],
                    ),
                  );

                  }

              )
              ]
            ),
          ),
        ),


      ],
    );
  }
}
