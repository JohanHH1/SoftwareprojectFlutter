import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Madaffald extends StatelessWidget {
  const Madaffald({super.key});

// funktion til at håndtere url, så den åbner i browser i appen
  void _madaffaldinfo() async {
    final url = Uri.parse(
        'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-madaffald');
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
          'Madaffald',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 162, 62),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere madaffald',
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
                  'assets/madaffaldinfo.png',
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
                        'Ja, tak - det er madaffald',
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
                              text: '• Æggeskaller \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Kaffefiltre og teposer \n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Afskårne blomster og krydderurter\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Al maddaffald - råt og tilbedredt\n ',
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
                        'Nej, tak - det er ikke madaffald',
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
                              text: '• Jord\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Dyrestrøelse f.eks. kattegrus\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text:
                                  '• Bagepapir og muffinpapir(restaffald) \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Servietter(restaffald)\n',
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
            Row(
              children: [
                Flexible( // gør at teksten kun tage den plads den skal bruge, selvom den er i en row
                child: Text(
                  ' Madaffald skal altid sorteres i de udleverede grønne bioposer. Husk at binde knude på poserne for at minimere lugten ',
                ),
                ),
                GestureDetector( // sender brugeren til linket ved at trykke på for mere information der indeholder linket
                  onTap: _madaffaldinfo,
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