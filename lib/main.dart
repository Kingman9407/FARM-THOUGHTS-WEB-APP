import 'package:farm_thoughts_web_app/core/provider/app_info_provider.dart';
import 'package:farm_thoughts_web_app/core/provider/internet_checker_provider.dart';
import 'package:farm_thoughts_web_app/core/router/app_router.dart';
import 'package:farm_thoughts_web_app/features/customer/provider/customer_provider.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/provider/delivery_agents_provider.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/providers/delivery_entries_provider.dart';
import 'package:farm_thoughts_web_app/features/lines/providers/lines_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        // Delivery Agents provider
        ChangeNotifierProvider(create: (context) => DeliveryAgentsProvider()),

        // App info provider
        ChangeNotifierProvider(create: (context) => AppInfoProvider()),

        // Customer Provider
        ChangeNotifierProvider(create: (context) => CustomerProvider()),

        // Delivery Entries Provider
        ChangeNotifierProvider(create: (context) => DeliveryEntriesProvider()),

        // Internet Checker Provider
        ChangeNotifierProvider(create: (context) => InternetCheckerProvider()),

        // lines Provider
        ChangeNotifierProvider(create: (context) => LinesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}
