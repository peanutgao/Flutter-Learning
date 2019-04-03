import 'package:flutter/material.dart';


class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.map),
          title: new Text('Maps'),
        ),
        new ListTile(
          leading: new Icon(Icons.access_alarm),
          title: new Text('Alarm'),  
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('Phone'),
        ),
      ],
    );
  }
}


class HListViewDemo extends StatelessWidget {
  
  final itemW = 160.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: itemW,
            color: Colors.red,
          ),
          new Container(
            width: itemW,
            color: Colors.pink,
          ),
          new Container(
            width: itemW,
            color: Colors.green,
          ),
          new Container(
            width: itemW,
            color: Colors.yellow,
          ),
          new Container(
            width: itemW,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
