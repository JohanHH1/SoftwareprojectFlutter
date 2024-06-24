// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Affaldstyper.dart';
import 'package:flutter_settings_bar_design/Glas.dart';
import 'package:flutter_settings_bar_design/ItemDetailPage.dart';
import 'package:flutter_settings_bar_design/Madaffald.dart';
import 'package:flutter_settings_bar_design/Papir.dart';
import 'package:flutter_settings_bar_design/metal.dart';
import 'package:flutter_settings_bar_design/navigation_bar.dart';
import 'package:flutter_settings_bar_design/pap.dart';
import 'package:readmore/readmore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Appbar med titel og styling
      appBar: AppBar(
        backgroundColor: const Color(-4072000),
        title: const Text(
          'Sorteringshjælperen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 48, 40, 40),
          ),
        ),
        automaticallyImplyLeading: false, // sjuler automatiske tilbageknap
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Scrollbar( // Scrollbar til lodret scrolling
        child: SingleChildScrollView( // Gør hele kroppen scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Hyppigste affaldsstyper',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 30, 12, 30),
                child: Scrollbar( // Scrollbar til vandret scrolling
                  thickness: 2, // Tykkelse af scrollbar
                  trackVisibility: true,
                  child: SizedBox(
                    height: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal, // Vandret scrolling
                      children: [
                        GestureDetector(
                          onTap: () { // Ved trykk på elementet, navigeres der til ItemDetailPage med detaljer om produktet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailPage(item: {
                                        'name': 'Sølvpapir',
                                        'category': 'Metal',
                                        'image': 'sølvpapir.png',
                                        'tips':
                                            'Sølvpapir, der har indeholdt mad, skal tømmes, så godt du kan.',
                                      })),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/sølvpapir.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Text(
                                'Sølvpapir',
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Metal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 82, 23),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailPage(item: {
                                        'name': 'Teblade og kaffegrums',
                                        'category': 'Madaffald',
                                        'image': 'kaffe.png',
                                        'tips': '',
                                      })),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/kaffe.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Text(
                                'Kaffefilter og kaffegrums',
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Madaffald',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 82, 23),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailPage(item: {
                                        'name': 'Mælkekarton',
                                        'category': 'Plast',
                                        'image': 'mælk.png',
                                        'tips':
                                            'Husk at trykke kartonen flad for at udnytte pladsen i beholderen bedst muligt.',
                                      })),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/mælk.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Text(
                                'Mælkekarton',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Plast',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 82, 23),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailPage(item: {
                                        'name': 'Skyrbøtte',
                                        'category': 'Plast',
                                        'image': 'skyr.PNG',
                                        'tips':
                                            'Tøm emballagen for indhold, så godt du kan. Du behøver ikke at skylle eller vaske den.',
                                      })),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/skyr.PNG'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Text(
                                'Skyrbøtte',
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Plast',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 82, 23),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailPage(item: {
                                        'name': 'Pizzabakke',
                                        'category': 'Restaffald',
                                        'image': 'pizzabox.png',
                                        'tips': 'Beskidt pap, som pizzabakker, kan desværre ikke genanvendes. Derfor skal det sorteres som restaffald.',
                                      })),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/pizzabox.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              Text(
                                'Pizzabakke',
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Restaffald',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 21, 82, 23),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Row( // arrangerer børnene vandret
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      child: Column( 
                        children: [
                          ExpansionTile( // Første ExpansionTime
                            title: Text(
                                'Sådan gør du med plastikproppen på papemballagen'),
                            children: <Widget>[
                              Padding( 
                                padding: EdgeInsets.all(8.0), 
                                child: Text(
                                    'Det er ikke nødvendigt at fjerne kapslen før sortering. Hvis du lader kapslen sidde, vil papemballagen og plastkapslen blive adskilt og materialegenanvendt korrekt. Det er bedre at lade kapslen sidde end at risikere, at den falder af og ender i naturen.'),
                              ),
                            ],
                          ),
                          ExpansionTile( // Anden ExpansionTile
                            title: Text('Hvorfor skal jeg sortere batterier?'),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    'Batterier kan indeholde kviksølv, cadmium og bly, som forårsager stor skade, hvis de slipper ud i naturen.'
                                    ' Løse småbatterier bruges fx i lommelygter, ure, fjernbetjeninger eller kameraer. Indbyggede batterier findes bl.a. i eltandbørster, computere, legetøj eller værktøj.'
                                    'Løse småbatterier skal afleveres i batteribakker eller lignende beholdere. Produkter med indbyggede batterier skal afleveres sammen med andet elektronikaffald, normalt på kommunens genbrugsstation. Bilbatterier skal afleveres på kommunens genbrugsstation eller lignende steder eller hos forhandlere af bilbatterier.'
                                    'Husk på, at mange af de ting, der bevæger sig, blinker eller larmer, drives af batteri - selvom det ikke er synligt.'),
                              ),
                            ],
                          ),
                          ExpansionTile( // Trejde ExpansionTile
                            title: Text(
                                'Sådan genanvender du 5 almindelige take-away emballager'),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    'Det er dejligt med picnic, grillmiddage og frokoster i det fri, men det resulterer ofte i mange brugte take-away-emballager.'
                                    '\n1. Sushiemballage og pinde - Tøm sushiemballagen for madrester og genanvend den som plastemballage. Smid pindene i husholdningsaffaldet, medmindre de er i en papirpose.'
                                    '\n2. Pizzabakke - Tøm bakken for madrester og genanvend den som papiremballage.'
                                    '\n3. Hvid kartonemballage (f.eks. nudler/wok) - Tøm kartonemballagen for madrester og genanvend den som papiremballage.'
                                    '\n4. EPS-skål (f.eks. kebab og pommes frites) - Tøm skålen for madrester og genanvend den som plastemballage.'
                                    '\n5. Salatbakke - Tøm bakken for madrester. Hvis den er i plast, skal den genanvendes som plastemballage uanset farve. Læg den lille plastikbøtte med dressing i plastgenanvendelsen.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
const Padding( // Padding omkring teksten 'Affaldstyper'
  padding: EdgeInsets.only(left: 16, right: 10, top: 20, bottom: 10),
  child: Text(
    'Affaldstyper',
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
),

              Row( // Arrangerer 'Vis alle' knappen til højre
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton( // Navigerer til klassen 'Affaldstyper' vid trykk
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Affaldstyper()),
                      );
                    },
                    child: const Text('Vis alle'),
                  ),
                ],
              ),
              Padding( // Padding før afstand omkring horisontale ListVeiw 
                padding: const EdgeInsets.fromLTRB(12, 1, 12, 40),
                child: SizedBox(
                  height: 160,
                  child: Scrollbar(
                    child: ListView( // Viser en horisontal liste af affaldstyper
                      scrollDirection: Axis.horizontal,
                      children: [ // GestureDetector widget til at håndtere tryk på ikon billedet
      
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Madaffald()),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/madaffald.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Glas()),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/glas.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Papir()),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/papir.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Metal()),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/metal.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pap()),
                            );
                          },
                          child: const Column(
                            children: [
                              Image(
                                image: AssetImage('assets/pap.png'),
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                child: SizedBox(
                  height: 20,
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
                child: Column(  // Arrangere teksten lodret
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
                    ReadMoreText( // ReadMoreText widget til at vise udvidbar tekst
                      'En nærgenbrugsstation er en mindre genbrugsstation placeret centralt i byen. '
                      'Her kan du give og tage gratis ting til genbrug (fx møbler, køkkenting, legetøj, bøger mv.), '
                      'og sortere udvalgte typer affald til genanvendelse.\n\n'
                      'Du kan låne en trækvogn, og enkelte steder en ladcykel, til at transportere dine genbrugsting til og fra dit hjem. '
                      'Kontakt personalet på genbrugsstationen om muligheden for udlån.\n\n'
                      'Der er desværre ikke plads til bil eller trailer på nærgenbrugsstationen.\n\n'
                      'På nærgenbrugsstationen kan du ikke aflevere byggeaffald og sanitetsudstyr (fx toilet og håndvask). '
                      'Det skal du aflevere på en af de store genbrugsstationer.\n\n',
                      trimLines: 1,
                      colorClickableText: Colors.blue, // Fave til ReadMoreText
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
                    ReadMoreText( // ReadMoreText widget til at vise udvidbar tekst
                      'Der er fem genbrugsstationer i København. Her kan du aflevere og sortere dit affald i over 30 fraktioner.'
                      'Se hvad du kan aflevere på genbrugsstationen (a-r-c.dk)'
                      'Alle større genbrugsstationer har også områder, hvor du kan give og tage gratis ting til genbrug. Er du i tvivl om, hvad der kan genbruges, kan du altid spørge personalet.',
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
      ),
      bottomNavigationBar: const NavigationBarr(), // Navigationsbar i bunden
    );
  }
}
