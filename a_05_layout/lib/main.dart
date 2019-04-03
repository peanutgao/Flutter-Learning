import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),

      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
              ),

              margin: const EdgeInsets.all(4.0),
              child: new Image.asset('images/emoji01.png'),
            ),
          ),

          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
              ),

              margin: const EdgeInsets.all(4.0),
              child: new Image.asset('images/emoji02.jpeg'),
            )
          )
        ],
      ),
    );

    return new Center(
      child: container,
    );
  }
}