// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/Affaldstyper.dart';
import 'package:flutter_settings_bar_design/Farligtaffald.dart';
import 'package:flutter_settings_bar_design/Glas.dart';
import 'package:flutter_settings_bar_design/Madaffald.dart';
import 'package:flutter_settings_bar_design/Papir.dart';
import 'package:flutter_settings_bar_design/Restaffald.dart';
import 'package:flutter_settings_bar_design/SearchPage.dart';
import 'package:flutter_settings_bar_design/TrashItem.dart';
import 'package:flutter_settings_bar_design/mad_og_drikkekartoner.dart';
import 'package:flutter_settings_bar_design/metal.dart';
import 'package:flutter_settings_bar_design/navigation_bar.dart';
import 'package:flutter_settings_bar_design/pap.dart';
import 'package:flutter_settings_bar_design/plast.dart';
import 'package:flutter_settings_bar_design/tekstilaffald.dart';
import 'package:readmore/readmore.dart';
import 'trash_information_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(-4072000),
        title: const Text(
          'Sorteringshjælperen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Velkommen!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Hypppigeste affaldsstyper:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 30, 12, 40),
            child: Container(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
              GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
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
                MaterialPageRoute(builder: (context) => SearchPage()),
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
                MaterialPageRoute(builder: (context) => SearchPage()),
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
                  'Mælk',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Mad- og drikkekartoner',
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
                MaterialPageRoute(builder: (context) => SearchPage()),
                );
              }, 
              child: const Column(
              children: [    
                Image(
                  image: AssetImage('assets/mutti.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                  ),
                  Spacer(),
                Text(
                  'Metaldåser (alle)',
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
                MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },  
              child: const Column(
              children: [  
                Image(
                  image: AssetImage('assets/æg.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Spacer(),
              Text(
                  'Æg og æggeskaller',
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
            ],
            ),
            
          ),
        ),
      const Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Expanded(
      child: Padding(
          padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ExpansionTile(
            title: Text('Sådan gør du med plastikproppen på papemballagen'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Det er ikke nødvendigt at fjerne kapslen før sortering. Hvis du lader kapslen sidde, vil papemballagen og plastkapslen blive adskilt og materialegenanvendt korrekt. Det er bedre at lade kapslen sidde end at risikere, at den falder af og ender i naturen.'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Hvorfor skal jeg sortere batterier?'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: 
                Text('Batterier kan indeholde kviksølv, cadmium og bly, som forårsager stor skade, hvis de slipper ud i naturen.'
' Løse småbatterier bruges fx i lommelygter, ure, fjernbetjeninger eller kameraer. Indbyggede batterier findes bl.a. i eltandbørster, computere, legetøj eller værktøj.'
'Løse småbatterier skal afleveres i batteribakker eller lignende beholdere. Produkter med indbyggede batterier skal afleveres sammen med andet elektronikaffald, normalt på kommunens genbrugsstation. Bilbatterier skal afleveres på kommunens genbrugsstation eller lignende steder eller hos forhandlere af bilbatterier.'
'Husk på, at mange af de ting, der bevæger sig, blinker eller larmer, drives af batteri - selvom det ikke er synligt.'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Sådan genanvender du 5 almindelige take-away emballager'),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Det er dejligt med picnic, grillmiddage og frokoster i det fri, men det resulterer ofte i mange brugte take-away-emballager.'
'\n1. Sushiemballage og pinde - Tøm sushiemballagen for madrester og genanvend den som plastemballage. Smid pindene i husholdningsaffaldet, medmindre de er i en papirpose.'
'\n2. Pizzabakke - Tøm bakken for madrester og genanvend den som papiremballage.'
'\n3. Hvid kartonemballage (f.eks. nudler/wok) - Tøm kartonemballagen for madrester og genanvend den som papiremballage.'
'\n4. EPS-skål (f.eks. kebab og pommes frites) - Tøm skålen for madrester og genanvend den som plastemballage.'
'\n5. Salatbakke - Tøm bakken for madrester. Hvis den er i plast, skal den genanvendes som plastemballage uanset farve. Læg den lille plastikbøtte med dressing i plastgenanvendelsen.'
),
              ),
            ],
          ),
        ],
      ),
    ),
    ),
  ],
),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed:
             (){
              Navigator.push(context, 
             MaterialPageRoute(builder: (context) => Affaldstyper()), 
              );
             },
             child: Text('Vis alle'),
            ),
        ],
      ),
      Padding(
            padding: const EdgeInsets.fromLTRB(12, 1, 12, 40),
            child: Container(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
              GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Madaffald()),
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
                Spacer(),
                Text(
                  'Madaffald',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
            ],
          ),  
        ),
              GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Glas()),
                );
              },  
              child: const Column(
              children: [
                Image(
                  image: AssetImage('assets/notDefined.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Spacer(),
              Text(
                  'Glas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Papir()),
                );
              },
              child: const Column(
              children: [           
                Image(
                  image: AssetImage('assets/notDefined.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Spacer(),
                Text(
                  'Papir',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
              ),
              GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MadOgDrikkekartoner()),
                );
              }, 
              child: const Column(
              children: [    
                Image(
                  image: AssetImage('assets/notDefined.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                  ),
                  Spacer(),
                Text(
                  'Mad- og drikkekartoner',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
                ),
              ),
              GestureDetector(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pap()),
                );
              },  
              child: const Column(
              children: [  
                Image(
                  image: AssetImage('assets/notDefined.png'),
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Spacer(),
              Text(
                  'Pap',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
               ),
              ],
              ),
              ),
                ],
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
            'Det skal du aflevere på en af de store genbrugsstationer.\n\n',
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
  bottomNavigationBar: NavigationBarr(),
);
}
}