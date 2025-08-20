import 'package:farm_thoughts_web_app/commons/widgets/side_bar.dart';
import 'package:farm_thoughts_web_app/features/auth/screens/login_screen.dart';
import 'package:farm_thoughts_web_app/features/dashboard/screens/dashboard.dart';
import 'package:farm_thoughts_web_app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/splash",

  routes: [
    GoRoute(
      path: "/splash",
      name: "splash",
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "login",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/dashboard",
      name: "dashboard",
      builder: (context, state) => Dashboard(),
    ),
    GoRoute(
      path: "/sidebar",
      name: "sidebar",
      builder: (context, state) => SideBar(),
    ),
  ],
);
