import 'package:flutter/material.dart';
import 'package:smart_campus/buildings/images/comm.dart';
import 'package:smart_campus/buildings/labs/comm.dart';

class CommunicationBuildingPage extends StatelessWidget {
  const CommunicationBuildingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communication Building'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.wifi_calling_3, color: Colors.blue),
              title: const Text('Laboratories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommunicationLabsPage(),
                  ),
                );
                // Add navigation or functionality for Laboratories
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.green),
              title: const Text('Course Materials'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommImagesPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
