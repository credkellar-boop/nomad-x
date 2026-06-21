import 'package:flutter/material.dart';
import '../translator/translator_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOMAD-X // COMMAND CENTER'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.data_usage),
            onPressed: () {},
            tooltip: 'System Telemetry',
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar Navigation
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.translate),
                label: Text('Engine'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.analytics),
                label: Text('Metrics'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main Content Area
          const Expanded(
            child: TranslatorView(),
          ),
        ],
      ),
    );
  }
}
