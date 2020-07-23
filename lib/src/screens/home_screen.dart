import 'package:flutter/material.dart';
import 'package:parallax_effect/src/widgets/sliding_cards.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox( height: 10 ),

            Container(
              margin: EdgeInsets.symmetric( horizontal: 10),
              child: Text('Opciones', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),)
            ),

            SizedBox( height: 20 ),

            SlidingCardsView()
          ],
        )
      )
   );
  }
}