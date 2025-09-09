import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ViewCustomerDetails extends StatelessWidget {
  final Map<String, String> customerDetails;
  const ViewCustomerDetails({super.key, required this.customerDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //nav row

        Row(
          children: [
            IconButton(onPressed: () { context.readCustomerProvider.resetAll();}, icon:Icon(Icons.arrow_back)),

            const Spacer(),
            IconButton(onPressed: () { context.readCustomerProvider.setEditEnable(true);},icon:Icon(Icons.edit)),
            SizedBox(width: context.screenWidth * 0.003),
            Icon(Icons.delete),
          ],
        ),
        SizedBox(height: context.screenWidth * 0.003),

        // profile row

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: CachedNetworkImage(
                    imageUrl: customerDetails['imageURL']!,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customerDetails['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600

                  ),
                  ),
                  Text(customerDetails['phone']!),
                ],
              ),
            ),
          ],
        ),


        //Wallet Card

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          color: AppColors.primaryColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.003,
                          vertical: context.screenWidth * 0.003,
                        ),

                        child: Row(
                          children: [
                            Icon(Icons.wallet),
                            SizedBox(width: context.screenWidth * 0.002),
                            Text(
                              "wallet Balance",
                              style: TextStyle(color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.all(context.screenWidth * 0.003),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(  context.screenWidth * 0.003),
                              child: Text(
                                '₹5000.00',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,

                                ),
                              ),
                            ),

                            Text(
                              'balance reduce from the current bill',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.hintTextFormFiledColor,
                                fontSize: 10,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),



            //QR img

            Expanded(
              flex: 3,
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(

                    width:  200,
                    child: PrettyQrView.data(
                      data:'https://farmthoughts.in/',
                        ),
                  ),
                )

                  )
            ,
          ],
        ),

        Row(

          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('Customer Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,


                      ),),
                    ),
                    Text('5,Gandhi St,Nehru Nagar, Muthialpet ,Pududcherry - 605003',
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),)

                  ],
                ),
              ),
            )
          ],

        ),
        Row(
          children: [Expanded(
              child: Padding(
                padding:  EdgeInsets.all(context.screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical:context.screenHeight * 0.01),
                      child: Text('Joined at',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            color: AppColors.hintTextFormFiledColor

                        ),),
                    ),
                    Text('08,Nov,2018',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),)

                  ],
                ),
              ),

            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:context.screenHeight * 0.01),
                      child: Text('Current Bill',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            color: AppColors.hintTextFormFiledColor

                        ),),
                    ),
                    Text('₹5000.00',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),)

                  ],
                ),
              ),
            )

          ]


        ),
        Row(
            children: [Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                      child: Text('Plans',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            color: AppColors.hintTextFormFiledColor

                        ),),
                    ),
                    Text('1 litre',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),)

                  ],
                ),
              ),

            ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(context.screenHeight * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                        child: Text('Litre Price',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.hintTextFormFiledColor

                          ),),
                      ),
                      Text('₹5000.00',
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),)

                    ],
                  ),
                ),
              )

            ]


        ),
        Row(

          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('Deliviery Days',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintTextFormFiledColor,


                        ),),
                    ),
                    Text('All Days',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),)

                  ],
                ),
              ),
            )
          ],

        ),
        Row(

          children: [

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                      child: Text('Leave Days (Month:june)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintTextFormFiledColor,


                        ),),
                    ),
                    Text('22,26',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),)

                  ],
                ),
              ),
            )
          ],

        ),
         
    ]

    );

  }
}
