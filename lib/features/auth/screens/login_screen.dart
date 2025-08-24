import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
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
    context.readAppInfoProvider.loadAppInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.primary,
              height: double.infinity,
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.logo,
                  height: 300,
                  width: 300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To Mee Industries",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                OAuthButton(
                  onPressed: () => context.pushReplacementNamed("sidebar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
