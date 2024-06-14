import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/HyppigesteAffaldstyper.dart';
import 'package:flutter_settings_bar_design/trash_information_page.dart';
import 'LocationPage.dart';
import 'TrashItem.dart';
import 'TrashItemList.dart';
import 'navigation_bar.dart';
import 'SearchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importer filen med Firebase konfigurationen
import 'package:readmore/readmore.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Sikrer at bindinger er initialiseret før runApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);// Initialiser Firebase med de korrekte konfigurationsindstillinger
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteringshjælperen',
        
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center( 
        child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 40, 12, 4),
            child: Container(
              height: 200,
              child: RichText(
                text: const TextSpan(
                  text: 'Velkommen!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), 
          ),
          HyppigsteAffaldstyper(),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 1, 12, 40),
            child: Container(
              height: 200,
              child: ListView(scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
                
          //const NavigationBarr(),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: 200,
                  color: Color.fromARGB(255, 8, 157, 243),
                ),
                  ),
                ],
              ),
            ),
          ),
          //HyppigsteAffaldstyper(),
          Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Container(
                height: 200,
                child: RichText(
                  text: const TextSpan(
                    text: 'Find vej til din\ngenbrugsstation ↓',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), 
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 4),
              child: Container(
                height: 30,
                child: RichText(
                  text: const TextSpan(
                    text: 'Hvad kan jeg aflevere på genbrugsstationen?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), 
              ),
            ),
            const Padding(
            padding: EdgeInsets.all(7.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nærgenbrugsstationer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 2),
              ReadMoreText(
                'En nærgenbrugsstation er en mindre genbrugsstation placeret centralt i byen. '
                'Her kan du give og tage gratis ting til genbrug (fx møbler, køkkenting, legetøj, bøger mv.), '
                'og sortere udvalgte typer affald til genanvendelse.\n\n'
                
                'Du kan låne en trækvogn, og enkelte steder en ladcykel, til at transportere dine genbrugsting til og fra dit hjem. '
                'Kontakt personalet på genbrugsstationen om muligheden for udlån.\n\n'
                
                'Der er desværre ikke plads til bil eller trailer på nærgenbrugsstationen.\n\n'
                
                'På nærgenbrugsstationen kan du ikke aflevere byggeaffald og sanitetsudstyr (fx toilet og håndvask). '
                'Det skal du aflevere på en af de store genbrugsstationer.\n\n'
                
                'Se hvad du kan aflevere på nærgenbrugsstationen (a-r-c.dk)\n\n'
                
                'Liste over nærgenbrugsstationer i Københavns Kommune:\n\n'
                
                'Tingbjerg Nærgenbrugsstation, Ved Bygården 2, 2700 Brønshøj\n'
                'Haraldsgade Nærgenbrugsstation, Vermundsgade 47A, 2100 København Ø\n'
                'Nordhavn Nærgenbrugsstation, Helsinkigade 26, 2150 Nordhavn\n'
                'Møllegade Nærgenbrugsstation, Møllegade 25, 2200 København N\n'
                'Gartnergade Nærgenbrugsstation, Gartnergade 8-14, 2200 København N\n'
                'Langgade Nærgenbrugsstation, Herman Bangs Plads 2, 2500 Valby\n'
                'Enghave Nærgenbrugsstation, Sønder Boulevard 137, 1720 København V\n'
                'Christiania Nærgenbrugsstation, Sydområdet 32, 1422 København K\n'
                'Hørgården Nærgenbrugsstation, Brydes Allé 60A, 2300 København S\n'
                'Remiseparken Nærgenbrugsstation, Urmagerstien 26, 2300 København S\n'
                'Charlotte Ammundsens Plads Nærgenbrugsstation, Charlotte Ammundsens Plads 3, 1359 København K\n'
                'Østerbrohuset Nærgenbrugsstation, Århusgade 101, 2100 København',
                trimLines: 1,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Læs mere',
                trimExpandedText: ' Mindre',
              ),
              Text(
                'Genbrugsstationer (genbrugspladser)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 2),
              ReadMoreText(
              'Der er fem genbrugsstationer i København. Her kan du aflevere og sortere dit affald i over 30 fraktioner.'
              'Se hvad du kan aflevere på genbrugsstationen (a-r-c.dk)'
              'Alle større genbrugsstationer har også områder, hvor du kan give og tage gratis ting til genbrug. Er du i tvivl om, hvad der kan genbruges, kan du altid spørge personalet.'
              'Liste over genbrugsstationer i København'
              'Borgervænget Genbrugsstation, Sibeliusgade 80, 2200 København Ø'
              'Bispeengen Genbrugsstation, Bispeengbuen 35, 2000 Frederiksberg'
              'Kulbanevej Genbrugsstation, Retortvej 2, 2500 Valby'
              'Vermlandsgade Genbrugsstation, Herjedalsgade 2, 2300 København S'
              'Sydhavn Genbrugscenter, Bådehavnsgade 50, 2450 København SV',
                trimLines: 1,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Læs mere',
                trimExpandedText: ' Mindre',
              ),
            ],
          ),
        ),
        ],
        ),
      ),
      bottomNavigationBar: NavigationBarr(), 
    );
  }
}
