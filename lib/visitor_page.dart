import 'package:flutter/material.dart';

import 'buildings/comm.dart'; // Import the CommunicationBuildingPage
import 'buildings/elec.dart'; // Import the ElectronicBuildingPage
import 'buildings/labs/hangar.dart'; // Import the CommunicationLabsPage
import 'buildings/micha.dart'; // Import the MechatronicBuildingPage
import 'info.dart'; // Import the InfoPage

class VisitorPage extends StatelessWidget {
  const VisitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.wifi, color: Colors.blue),
              title: const Text('Communication Building'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommunicationBuildingPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.electrical_services,
                color: Colors.green,
              ),
              title: const Text('Electronic Building'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ElectronicBuildingPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.orange),
              title: const Text('Mechatronic Building'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MechatronicBuildingPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.warehouse, color: Colors.brown),
              title: const Text('Hangar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const hangarLabsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.grey),
              title: const Text('Information about ECCAT'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
