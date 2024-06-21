
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Pap extends StatelessWidget {
  const Pap({super.key});

  void _launchURL() async {
    final url = Uri.parse('https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-pap');
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
          'Pap',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 233, 199, 120),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere pap',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 200, // Minimum width
                  minHeight: 200, // Minimum height
                  maxWidth: 400, // Maximum width
                  maxHeight: 400, // Maximum height
                ),
                child: Image.asset(
                  'assets/papinfo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        'Ja, tak - det er pap',
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
                        'Nej, tak - det er ikke pap',
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




