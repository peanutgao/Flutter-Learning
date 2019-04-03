import 'package:flutter/material.dart';
import './detailScreen.dart';
import './todo.dart';

class TodoListPage extends StatelessWidget {

  final dataArray = List.generate(
    20, 
    (index) => Todo('title-$index', 'desc-$index')
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      ),

      body: new ListView.builder(
        itemCount: this.dataArray.length,
        itemBuilder: (context, index){
          final todo = this.dataArray[index];
          return new ListTile(
            title: new Text(todo.title),

            // cell 点击事件
            onTap: (){
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new DetailScreen(todo: todo),
                )
              );
            },
          );
        },
      )
    );
    
    
  }
}
