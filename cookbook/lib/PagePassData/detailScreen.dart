import 'package:flutter/material.dart';
import './todo.dart';
import './todoListPage.dart';

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Todo Detail'),
      ),
      body: new ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(index == 0 ? this.todo.title : this.todo.desc),
          );
        }
      ),
    );
  }
}
