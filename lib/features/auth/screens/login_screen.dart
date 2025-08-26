import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/constants/app_router_constants.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/auth/widgets/o_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // Load App Info Version
    context.readAppInfoProvider.loadAppInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Logo
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.primaryColor,
              height: double.infinity,
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.logo,
                  height: context.screenHeight * 0.28,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Auth
          Expanded(
            child: ColoredBox(
              color: AppColors.whiteColor,
              child: Stack(
                children: [
                  // Auth Content
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Welcome Text
                        Text(
                          "Welcome To\nFarm Thoughts",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.03,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        SizedBox(height: context.screenHeight * 0.04),

                        // Sign in With Google Btn
                        OAuthButton(
                          height: context.screenHeight * 0.05,
                          width: context.screenWidth * 0.07,
                          btnSvgPath: AppAssets.googleLogo,
                          btnTitle: "Sign in with Google",
                          onPressed: () => GoRouter.of(
                            context,
                          ).pushReplacementNamed(AppRouterConstants.dashboard),
                        ),
                      ],
                    ),
                  ),

                  // Levitate Studios
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Text(
                      "© Farm Thoughts 2025",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.007,
                        fontWeight: FontWeight.w500,
                        color: AppColors.copyWriteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
