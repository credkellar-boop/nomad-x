import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../features/translator/translator_provider.dart';
import '../features/metrics/metrics_provider.dart';
import 'api_client.dart';

class AppProviders {
  /// Consolidates high-efficiency global state tracking 
  /// and updates to prevent layout redraw bottlenecks.
  static List<SingleChildWidget> get dependencies => [
        Provider<ApiClient>(
          create: (_) => ApiClient(),
        ),
        ChangeNotifierProxyProvider<ApiClient, TranslatorProvider>(
          create: (context) => TranslatorProvider(apiClient: context.read<ApiClient>()),
          update: (_, apiClient, previous) => previous ?? TranslatorProvider(apiClient: apiClient),
        ),
        ChangeNotifierProvider<MetricsProvider>(
          create: (_) => MetricsProvider()..initializeTelemetryStream(),
        ),
      ];
}
