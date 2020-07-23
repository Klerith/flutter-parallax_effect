import 'package:flutter/material.dart';
import 'package:parallax_effect/src/widgets/sliding_card.dart';



class SlidingCardsView extends StatefulWidget {
  
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {

  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);

    pageController.addListener(() {
      setState(() => pageOffset = pageController.page); //<-- add listener and set state
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.53,  //<-- set height of the card
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(                                 //<-- new widget
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset, //<-- pass offset
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1, //<-- pass offset - indexOfCard
          ),
        ],
      )
    );
  }
}