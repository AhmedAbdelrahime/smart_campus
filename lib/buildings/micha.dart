import 'package:flutter/material.dart';

import 'images/micha.dart';
import 'labs/micha.dart';

class MechatronicBuildingPage extends StatelessWidget {
  const MechatronicBuildingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechatronic Building'),
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
              leading: const Icon(Icons.build, color: Colors.blue),
              title: const Text('Laboratories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const michaLabsPage(),
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
                    builder: (context) => const MichaImagesPage(),
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
