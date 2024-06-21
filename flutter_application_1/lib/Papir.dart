
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Papir extends StatelessWidget {
  const Papir({super.key});

  void _launchURL() async {
    final url = Uri.parse('https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-papir');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Papir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
       backgroundColor: Color.fromARGB(255, 125, 207, 229),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere papir',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 150, // Minimum width
                  minHeight: 150, // Minimum height
                  maxWidth: 400, // Maximum width
                  maxHeight: 400, // Maximrum height
                ),
                child: Image.asset(
                  'assets/papirinfo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        'Ja, tak - det er papir',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '- makeup',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        'Nej, tak - det er ikke papir',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '- Medicinsrester\n - Kanyler',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: _launchURL,
              child: const Text(
                'For mere information',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




