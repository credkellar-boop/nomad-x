import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORPORATE TREASURY'),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white24, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: const Color(0xFF0F0F0F),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MONAD NETWORK BALANCE', style: TextStyle(color: Colors.white54, letterSpacing: 2.0)),
                  SizedBox(height: 8),
                  Text('1,250,000.00 MON', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'IBMPlexMono')),
                  SizedBox(height: 16),
                  Text('Connected: 0x8F9...3C1A', style: TextStyle(color: Colors.greenAccent, fontFamily: 'IBMPlexMono')),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sync),
              label: const Text('SYNC LEDGER'),
            ),
          ],
        ),
      ),
    );
  }
}
