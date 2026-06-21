import 'package:flutter/material.dart';

class CorporateMetrics {
  /// Immutable layout and timing constants to ensure 
  /// a uniform workspace experience across all platforms.
  
  static const double sidebarWidth = 260.0;
  static const double headerHeight = 64.0;
  static const EdgeInsets defaultPadding = EdgeInsets.all(24.0);
  
  // Animation strictly limited to 0ms to 150ms to enforce the "instantaneous" business feel.
  static const Duration snapTransition = Duration(milliseconds: 100);
  
  static const String enterpriseDomain = "api.nomad-x.corporate";
  static const String placeholderWallet = "0x0000000000000000000000000000000000000000";
}
