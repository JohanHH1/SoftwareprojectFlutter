
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Farligtaffald extends StatelessWidget {
  const Farligtaffald({super.key});

  void _launchURL() async {
    final url = Uri.parse('https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-farligt-affald');
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
          'Farligtaffald',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 219, 17, 17),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere farligt affald',
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
                  maxWidth: 500, // Maximum width
                  maxHeight: 500, // Maximum height
                ),
                child: Image.asset(
                  'assets/farligtinfo.png',
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
                        'Ja, tak - det er faligt affald',
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
                        'Nej, tak - det er ikke farligt affald',
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




