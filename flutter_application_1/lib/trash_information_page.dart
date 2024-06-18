import 'package:flutter/material.dart';
import 'TrashItem.dart';

class trash_information_page extends StatelessWidget {
  final TrashItem trashItem;

  const trash_information_page({Key? key, required this.trashItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trashItem.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),  // Yderligere plads rundt om dataene
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Color.fromARGB(255, 95, 174, 98),  Color(-4072000)], // Gradient farver
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(12.0), // Rundede hjørner
          ), // Grøn baggrund
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Name: ${trashItem.name}'),
                Text('Sorting Type: ${trashItem.sortingType}'),
                Text('Tip: ${trashItem.tips}'),
                Image(
                  image: AssetImage(trashItem.imageUrl),
                  width: 200,
                  height: 200,
                ),
                Image(
                  image: AssetImage(trashItem.sortingType + '.png'),
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      );
  }
}