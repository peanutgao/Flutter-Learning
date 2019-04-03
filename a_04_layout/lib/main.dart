import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  
  Widget _buildInfo() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        new Text(
          'Hello World',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        new Text(
          '''
          Welcome flutter World,Welcome flutter World,Welcome flutter World,Welcome flutter World,Welcome flutter World,Welcome flutter World,
          ''',
          softWrap: true,
        ),


      ],
    );
  }

  Widget _buildImage() {
    return new Image.asset('images/pavlova.png');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Container(

          child: new Row(
            children: <Widget>[
              new Expanded(
                child: _buildInfo(),
                flex: 2,
              ),

              new Expanded(
                child: _buildImage(),

                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child:
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
            ],
          ),

          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );


    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.kitchen, color: Colors.green[500],),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            )
          ],
        ),
      )
    );
  }
}