import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome for WhatsApp icon

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  // Function to launch a URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to make a phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not make a call to $phoneNumber';
    }
  }

  // Function to open WhatsApp
  void _openWhatsApp(String phoneNumber) async {
    final Uri uri = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open WhatsApp for $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information about ECCAT'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info, color: Colors.blue),
                      title: const Text(
                        'About ECCAT',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Click here to know more about ECCAT',
                      ),
                      onTap: () {
                        _launchURL(
                          'https://suez.edu.eg/ar/2024/08/26/%D8%AA%D8%B9%D8%B1%D9%81-%D8%B9%D9%84%D9%89-%D8%A3%D9%82%D8%B3%D8%A7%D9%85-%D9%88%D9%85%D8%AC%D8%A7%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B9%D9%85%D9%84-%D8%A8%D8%A7%D9%84%D9%83%D9%84%D9%8A%D8%A9-%D8%A7/',
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.red),
                      title: const Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Al Gamaa, Al Temsah, Ismailia, Ismailia Governorate 8367520',
                      ),
                      onTap: () {
                        _launchURL(
                          'https://www.google.co.in/maps/place/Egyptian+Chinese+college+for+applied+technology/@30.6021918,32.3049271,16.61z/data=!4m14!1m7!3m6!1s0x14f8597f201556e7:0x9bd6053867337ff3!2sSuez+Canal+University!8m2!3d30.6229541!4d32.2690689!16s%2Fm%2F04jh6b2!3m5!1s0x14f859ebf8cae4dd:0xe04e1e482607c808!8m2!3d30.602013!4d32.306132!16s%2Fg%2F11rxwncnyb?entry=ttu&g_ep=EgoyMDI1MDQxNi4xIKXMDSoASAFQAw%3D%3D',
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.facebook, color: Colors.blue),
                      title: const Text(
                        'Facebook',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Visit our Facebook page'),
                      onTap: () {
                        _launchURL(
                          'https://web.facebook.com/2018ECCAT#',
                        ); // Replace with your Facebook page link
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: const Text(
                        'Phone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Call us at 01141301511'),
                      onTap: () {
                        _makePhoneCall(
                          '01141301511',
                        ); // Replace with your phone number
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                      title: const Text(
                        'WhatsApp',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Chat with us on WhatsApp'),
                      onTap: () {
                        _openWhatsApp(
                          '+201141301511',
                        ); // Replace with your phone number
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
