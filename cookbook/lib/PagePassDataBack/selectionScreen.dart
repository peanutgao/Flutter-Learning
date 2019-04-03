import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('选择一个回传'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: (){
                  /// 返回的值直接给 pop() 函数
                  Navigator.pop(context, 'Yep!');
                },
                child: new Text('Yep!'),
              )
            ),

            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'Nope');
                },
                child: new Text('Nope'),
              ),
            )
          ],
        ),
      ),
    );
  }
}