import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Pap extends StatelessWidget {
  const Pap({super.key});

  void _papinfo() async {
    final link = Uri.parse(
        'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-pap');
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
          'Pap',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 233, 199, 120),
      ),
      body: SingleChildScrollView(
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
                    children: [
                      const Text(
                        'Ja, tak - det er pap',
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
                              text: '• Skotøjsæsker \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Æggebakker (rene og tørre)\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Karton\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Æsken/papkassen fra f.eks. tandpasta og morgenmadsprodukter\n ',
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
                        'Nej, tak - det er ikke pap',
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
                              text: '• Pizzabakker eller en anden emballage med madrester(restaffald)\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '•Flamingo\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text:
                                  '• Papir \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Vådt pap\n',
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
                  onTap: _papinfo,
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