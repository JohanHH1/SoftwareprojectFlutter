import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Restaffald extends StatelessWidget {
  const Restaffald({super.key});

  void _restinfo() async {
    final link = Uri.parse(
        'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-restaffald');
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
          'Restaffald',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 236, 232, 232),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 34, 33),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere restaffald',
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
                  maxHeight: 400, // Maximum height
                ),
                child: Image.asset(
                  'assets/restaffaldinfo.png',
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
                    children: [
                      const Text(
                        'Ja, tak - det er restaffald',
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
                              text: '• Cigaretskod \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Beskidt emballage af pap og papir)\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Hygiejneaffald herunder vatpinde og tandbørster\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Støvsugsposer\n ',
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
                        'Nej, tak - det er ikke restaffald',
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
                              text: '• Trykflasker(genbrugsplads)\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Store flamingokasser(genbrugsplads)\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text:
                                  '• Kemikalier(farligt affald) \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Elpærer(farligtaffald)\n',
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
                  'Du behøver ikke fjerne clips, tape, labels eller lignende ',
                ),
                GestureDetector(
                  onTap: _restinfo,
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
