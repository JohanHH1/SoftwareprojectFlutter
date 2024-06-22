import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Plast extends StatelessWidget {
  const Plast({super.key});

  void _plastinfo() async {
    final link = Uri.parse(
        'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-plast');
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
          'Plast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 181, 69, 203),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sådan skal du sortere plast',
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
                  'assets/plastinfo.png',
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
                        'Ja, tak - det er plast',
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
                              text: '• Plastbaker, -bøtter og -låg\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Plastfolier og -film\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Plastflasker uden pant\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Hård og blød plast\n ',
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
                        'Nej, tak - det er ikke plast',
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
                              text: '• Plastemballage med metaliefolie\n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Produkter sammensat af forskellige materialer\n'
                               'som du ikke kan skille ad\n',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text:
                                  '• Gummistøvler, regntøj (genbrugsplads) \n ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: '• Uhygiejnisk plast f.eks. tandbørster\n',
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
                  ' Emballage, der har indeholdt mad eller drikke, skal tømmes, så godt du kan ',
                ),
                GestureDetector(
                  onTap: _plastinfo,
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