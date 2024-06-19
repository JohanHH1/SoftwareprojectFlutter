import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Farligtaffald.dart';
import 'package:flutter_settings_bar_design/Glas.dart';
import 'package:flutter_settings_bar_design/Papir.dart';
import 'package:flutter_settings_bar_design/mad_og_drikkekartoner.dart';
import 'package:flutter_settings_bar_design/madaffald.dart';
import 'package:flutter_settings_bar_design/metal.dart';
import 'package:flutter_settings_bar_design/navigation_bar.dart';
import 'package:flutter_settings_bar_design/pap.dart';
import 'package:flutter_settings_bar_design/plast.dart';
import 'package:flutter_settings_bar_design/restaffald.dart';
import 'package:flutter_settings_bar_design/tekstilaffald.dart';

class Affaldstyper extends StatelessWidget {
  const Affaldstyper({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oversigt over affaldstyperne'),
        backgroundColor: Color.fromARGB(255, 152, 231, 159),
      ),
       body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between columns
              childAspectRatio: 1.0, // Aspect ratio of the items
            ),
            itemCount: atyper.length,
            itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    switch (index) {
                      case 0:
                        return Madaffald();
                      case 1:
                        return Restaffald();
                      case 2:
                        return Plast();
                      case 3:
                        return MadOgDrikkekartoner();
                      case 4:
                        return Metal();
                      case 5:
                        return Pap();
                      case 6:
                        return Glas();
                      case 7: 
                        return Papir();
                      case 8:
                        return Farligtaffald();
                      case 9:
                        return Tekstilaffald();
                      default:
                        return Scaffold(
                          appBar: AppBar(
                            title: Text('Page $index'),
                          ),
                          body: Center(
                            child: Text('Page $index'),
                          ),
                        );
                    }
                  }),
                );
              },
               child: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              atyper[index].biilede,
              height: 60, // Adjust as needed
            ),
            SizedBox(height: 8),
            Text(
              atyper[index].navn,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  },
),
),
 bottomNavigationBar: NavigationBarr(),
    );
  }
}

class Atype {
  final String navn;
  final String biilede;

  Atype(this.navn, this.biilede);
}

List<Atype> atyper = [
  Atype('Madaffald', 'assets/madaffald.png'),
  Atype('Restaffald', 'assets/Restaffald.png'),
  Atype('Plastik',  'assets/plast.jpg'),
  Atype('Mad- og drikkekartoner',  'assets/madOgDrikke.jpg'),
  Atype('Metal',  'assets/metal.jpg'),
  Atype('Pap',  'assets/pap.jpg'),
  Atype('Glas', 'assets/glas.jpg'),
  Atype('Papir', 'assets/papir.jpg'),
  Atype('Farligtaffald',  'assets/farligtaffald.png'),
  Atype('Tekstilaffald',  'assets/tekstil.jpg'),
];
