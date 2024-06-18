// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_settings_bar_design/navigation_bar.dart';
import 'package:readmore/readmore.dart';



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
            padding: const EdgeInsets.fromLTRB(12, 1, 12, 40),
            child: Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                    Image(
                      image: AssetImage('assets/skyr.jpeg'),
                      width: 200,
                    ),     
                    Image(
                      image: NetworkImage('https://cdn.publisher-live.etc.nu/swp/uc3g8l/media/20221117131144_b73b67b408fa7d028dad635419b061a2b11205066fdffb804b501ef1882118a0.jpg'),
                      width: 200,
                    ),              
                    Image(
                      image: NetworkImage('https://www.frugtmanden.com/media/catalog/product/cache/ce641b62fe2b50b8865ff72d5b491831/a/r/arla_let.webp'),
                      width: 200,
                    ),
                    Image(
                      image: NetworkImage('https://buyersclub.blob.core.windows.net/images/items/1674279_0_500x500.jpg'),
                      width: 200,
                    ),
                    Image(
                      image: NetworkImage('https://media.licdn.com/dms/image/C5612AQFlwmIh-5At3w/article-cover_image-shrink_600_2000/0/1520062735263?e=2147483647&v=beta&t=l8F606J0PYRxZaef6l1YF2xFZBaP_wv6R5__76sJDyQ'),
                      width: 200,
                    ),
                ],
              ),
            ),
          ),
           const Padding(
            padding: EdgeInsets.only(left: 12, right: 10),
            child: Text(
              'Sorteringstips:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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