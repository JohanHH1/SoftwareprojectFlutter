import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Glas extends StatelessWidget {
  const Glas({super.key});

  void _glasinfo() async {
    final link = Uri.parse(
        'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-glas');
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Kan ikke åbne $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Glas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 219, 192),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere glas',
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
                  'assets/glasinfo.png',
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
                    children: [
                      const Text(
                        'Ja, tak - det er glas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '• Vitaminglas \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Glasskår',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Konserveglas og drikkeglas\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Glas og glaskflaser uden pant i alle farver \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),       
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Nej, tak - det er ikke glas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '• Porcelæn, spejle og keramik (genbrugsplads)\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Elpærer(farligt affald)\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text:
                                  '• Kemikalieflasker(farligt affald) \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Vinduesglas\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                const Text(
                  'I dag blive det meste glas knust og smeltet om til nye glasprodukter',
                ),
                GestureDetector(
                  onTap: _glasinfo,
                  child: const Text(
                    'for mere information',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}