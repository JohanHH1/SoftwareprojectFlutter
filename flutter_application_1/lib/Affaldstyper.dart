import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Farligtaffald.dart';
import 'package:flutter_settings_bar_design/Glas.dart';
import 'package:flutter_settings_bar_design/Papir.dart';
import 'package:flutter_settings_bar_design/madaffald.dart';
import 'package:flutter_settings_bar_design/metal.dart';
import 'package:flutter_settings_bar_design/navigation_bar.dart';
import 'package:flutter_settings_bar_design/pap.dart';
import 'package:flutter_settings_bar_design/Plast.dart';
import 'package:flutter_settings_bar_design/Restaffald.dart';
import 'package:flutter_settings_bar_design/Tekstilaffald.dart';

class Affaldstyper extends StatelessWidget {
  const Affaldstyper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oversigt over affaldstyperne'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        backgroundColor: const Color(-4072000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: GridView.builder( // hvordan hver celle bliver bygget op
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 9.0, // Spacing between rows
            crossAxisSpacing: 10.0, // Spacing between columns
            childAspectRatio: 1.0, // Aspect ratio of the items
          ),
          itemCount: atyper.length,  // viser antallet celler i grid
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                try { // try-catch der håndtere fejl 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      switch (index) { // switch case - så de bliver indekseret og vist korrekt
                        case 0:
                          return const Madaffald();
                        case 1:
                          return const Restaffald();
                        case 2:
                          return const Plast();
                        case 3:
                          return const Metal();
                        case 4:
                          return const Pap();
                        case 5:
                          return const Glas();
                        case 6:
                          return const Papir();
                        case 7:
                          return const Farligtaffald();
                        case 8:
                          return const Tekstilaffald();
                        default:
                          throw Exception('Ugyldig indeks: $index');
                      }
                    }),
                  );
                } catch (e) {
                  print(e.toString()); // Handle the exception appropriately
                }
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          atyper[index].billede, // anvender vores liste så den displayer billeder i rækkefølge
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const NavigationBarr(), 
    );
  }
}

// klsase Atype som håndterer billeder 
class Atype {
  final String billede;

  Atype(this.billede);
}
// liste over alle billederne samt deres rækkefølge de skal vises i 
List<Atype> atyper = [
  Atype('assets/madaffald.png'),
  Atype('assets/restaffald.png'),
  Atype('assets/plast.png'),
  Atype('assets/metal.png'),
  Atype('assets/pap.png'),
  Atype('assets/glas.png'),
  Atype('assets/papir.png'),
  Atype('assets/farligt_affald.png'),
  Atype('assets/tekstilaffald.png'),
];
