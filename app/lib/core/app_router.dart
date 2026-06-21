import 'package:flutter/material.dart';
import '../features/dashboard/dashboard_view.dart';
import '../features/settings/settings_view.dart';
import '../features/wallet/wallet_view.dart';

class AppRouter {
  /// Strict, deterministic routing table for the UI.
  /// No fluid animations; instantaneous state transitions only.
  
  static const String dashboard = '/';
  static const String settings = '/settings';
  static const String treasury = '/treasury';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return _buildRoute(const DashboardView());
      case AppRouter.settings:
        return _buildRoute(const SettingsView());
      case treasury:
        return _buildRoute(const WalletView());
      default:
        return _buildRoute(
          const Scaffold(
            body: Center(child: Text('ERR: UNKNOWN ROUTE', style: TextStyle(color: Colors.red))),
          ),
        );
    }
  }

  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration.zero, // Zero-latency UX
      reverseTransitionDuration: Duration.zero,
    );
  }
}
