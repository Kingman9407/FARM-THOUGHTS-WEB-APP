import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:farm_thoughts_web_app/features/lines/widgets/delivery_status_card.dart';
import 'package:farm_thoughts_web_app/features/lines/widgets/lines_card.dart';
import 'package:farm_thoughts_web_app/features/lines/widgets/locality_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineDashboardScreen extends StatefulWidget {
  const LineDashboardScreen({super.key});

  @override
  State<LineDashboardScreen> createState() => _LineDashboardScreenState();
}

class _LineDashboardScreenState extends State<LineDashboardScreen> {
  TextEditingController lineDashBoardController = TextEditingController();

  // Sample data created here
  final List<Map<String, dynamic>> lineCardsData = [
    {"lineName": "Line A", "customerCount": 250, "isSelected": true},
    {"lineName": "Line B", "customerCount": 180, "isSelected": false},
    {"lineName": "Line C", "customerCount": 320, "isSelected": false},
    {"lineName": "Line D", "customerCount": 150, "isSelected": false},
    {"lineName": "Line E", "customerCount": 210, "isSelected": false},
  ];

  int selectedIndex = 0;

  final List<String> localities = [
    "Ariyankuppam",
    "Anna Nagar",
    "Kuyavarpalayam",
    "Nellithope",
    "Mettupalayam",
    "Thavalakuppam",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DashboardTopBar(
            searchTextEditingController: lineDashBoardController,
            userImageUrl:
                "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),

          // Headers row
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.005,
              vertical: context.screenHeight * 0.01,
            ),
            child: Row(
              children: [
                const Expanded(flex: 2, child: Text("LINE NUMBER")),
                const Expanded(flex: 4, child: Text("LINE DETAILS")),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      // Add New
                      Expanded(
                        flex: 8,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              spacing: context.screenWidth * 0.002,
                              children: [
                                // Add Icon
                                SvgPicture.asset(
                                  AppAssets.addCircleIcon,
                                  height: context.screenWidth * 0.009,
                                  fit: BoxFit.cover,
                                ),

                                // Add Text
                                Text(
                                  "Add new",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                // Left side line cards
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: lineCardsData.length,
                    itemBuilder: (context, index) {
                      final data = lineCardsData[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.screenHeight * 0.006,
                          horizontal: context.screenWidth * 0.006,
                        ),
                        child: SizedBox(
                          height: context.screenHeight / 8,
                          child: LinesCard(
                            onTap: () {
                              setState(() {
                                for (var cards in lineCardsData) {
                                  cards['isSelected'] = false;
                                }
                                data['isSelected'] = true;
                              });
                            },
                            isSelected: data['isSelected'],
                            customerCount: data['customerCount'],
                            lineName: data['lineName'],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Right side blue container + calendar
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  30,
                                  30,
                                  30,
                                  5,
                                ),
                                child: Text(
                                  "Delivery Locality",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.screenWidth * 0.012,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: List.generate(localities.length, (
                                    index,
                                  ) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LocalityChip(
                                        isSelected: index == selectedIndex,
                                        label: localities[index],
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Divider(color: AppColors.hintTextFormFiledColor),

                              // Replace this part in your main screen:
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      // Add Expanded here
                                      child: Container(
                                        color: Colors.red,
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: 10,
                                          itemBuilder:
                                              (
                                                BuildContext context,
                                                int index,
                                              ) {
                                                return DeliveryStatusCard(
                                                  name: "Sreeramachandran",
                                                  address:
                                                      "5, Gandhi St, Nehru Nagar......",
                                                  phoneNumber:
                                                      "+91 631889124$index",
                                                  quantity: "${index + 1} L",
                                                  quantityUnit: "per day",
                                                  deliveredStatus:
                                                      index % 2 == 0,
                                                  deliveryTime:
                                                      "06:4${index}AM",
                                                );
                                              },
                                        ),
                                      ),
                                    ),

                                    VerticalDivider(
                                      color: AppColors.hintTextFormFiledColor,
                                    ),
                                    // Right side
                                    Expanded(
                                      child: Container(
                                        color: Colors.green,
                                        child: Center(
                                          child: Text("Right side"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: const KCalender(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
