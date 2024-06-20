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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              atyper[index].billede,
              height: 100, // Adjust as needed
            ),
            SizedBox(height: 10),
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
  final String billede;

  Atype(this.billede);
}

List<Atype> atyper = [
  Atype('assets/madaffald.png'),
  Atype('assets/Restaffald.png'),
  Atype('assets/plast.jpg'),
  Atype('assets/madOgDrikke.jpg'),
  Atype('assets/metal.jpg'),
  Atype('assets/pap.jpg'),
  Atype('assets/glas.jpg'),
  Atype('assets/papir.jpg'),
  Atype('assets/farligtaffald.png'),
  Atype('assets/tekstil.jpg'),
];
