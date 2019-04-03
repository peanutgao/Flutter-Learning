import 'package:flutter/material.dart';
import './selectionScreen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('反向传值'),
      ),
      body: new Center(
        child: new SelectionButton(),
      ),
    );
  }
}


class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
      child: new Text('Option'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    /// 返回的值
    /// 需要用 await，否则会被释放
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new SelectionScreen())
    );

    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('$result')));
  }

}