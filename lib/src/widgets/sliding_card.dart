import 'dart:math' as math;

import 'package:flutter/material.dart';

class SlidingCard extends StatelessWidget
 {
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String assetName; //<-- name of the image to be displayed
  final double offset;             //<-- How far is page from being displayed
  
  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName, 
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08)); //<--caluclate Gaussian function

    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0), //<-- Translate the cards to make space between them,
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), //<--custom shape
        child: Column(
          children: <Widget>[
            ClipRRect(  //<--clipping image
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)), 
              child: Image.asset( //<-- main image
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.none,
                alignment: Alignment(-offset.abs(), 0),       //<-- Set the alignment
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: _CardContent( //<--replace the Container with CardContent
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset; //<-- add the offset

  const _CardContent({
    Key key,
    @required this.name, 
    @required this.date, 
    @required this.offset,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0), //<-- translate the name label
            child: Text(name, style: TextStyle(fontSize: 20))
          ),
          SizedBox(height: 8),
          Text(date, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0), //<-- translate the button
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Text('Reserve'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0), //<-- translate the price label
                child: Text(
                  '0.00 \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}