import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';



class Farligtaffald extends StatelessWidget {
  const Farligtaffald({super.key});


void _launchURL() async {
  final url = Uri.parse('affald.kk.dk/affaldsfraktion/saadan-sorterer-du-farligt-affald');
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
        title: const Text('Farligtaffald ',
        style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,
        ),
        ),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Color.fromARGB(255, 219, 17, 17),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8, 9, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
            child: Text(
            'Sådan skal du sorterer du farligt affald',
            style: TextStyle(fontSize: 28,
            fontWeight: FontWeight.bold,
            ),
          ),
            ),
            Spacer(),
            GestureDetector(
              onTap: _launchURL,
                  child: const Text(
                    'https://affald.kk.dk/affaldsfraktion/saadan-sorterer-du-farligt-affald',
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


