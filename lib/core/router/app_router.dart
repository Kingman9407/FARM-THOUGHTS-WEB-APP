import 'package:farm_thoughts_web_app/commons/widgets/side_bar.dart';
import 'package:farm_thoughts_web_app/core/constants/app_router_constants.dart';
import 'package:farm_thoughts_web_app/features/auth/screens/login_screen.dart';
import 'package:farm_thoughts_web_app/features/collections/screens/collection_dashboard.dart';
import 'package:farm_thoughts_web_app/features/customer/screens/customer_dashboard.dart';
import 'package:farm_thoughts_web_app/features/dashboard/screens/dashboard.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/screens/delivery_agent_dashboard.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/screens/delivery_entries_dashboard.dart';
import 'package:farm_thoughts_web_app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    // Splash Screen
    GoRoute(
      path: "/splash",
      name: AppRouterConstants.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Login Screen
    GoRoute(
      path: "/login",
      name: AppRouterConstants.login,
      builder: (context, state) => LoginScreen(),
    ),

    // Shell Route with Sidebar for authenticated pages
    ShellRoute(
      builder: (context, state, child) {
        return SideBar(child: child);
      },
      routes: [
        GoRoute(
          path: "/dashboard",
          name: AppRouterConstants.dashboard,
          builder: (context, state) => const Dashboard(),
        ),
        GoRoute(
          path: "/delivery-agents",
          name: AppRouterConstants.deliveryAgents,
          builder: (context, state) => const DeliveryAgentDashboard(),
        ),
        GoRoute(
          path: "/entries",
          name: AppRouterConstants.deliveryEntries,
          builder: (context, state) => const DeliveryEntriesDashboard(),
        ),
        GoRoute(
          path: "/collection",
          name: AppRouterConstants.collection,
          builder: (context, state) => const CollectionDashboard(),
        ),
        GoRoute(
          path: "/customers",
          name: AppRouterConstants.customers,
          builder: (context, state) => const CustomerDashboard(),
        ),
      ],
    ),
  ],
);
