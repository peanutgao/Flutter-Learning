import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:BottomNavigationBarDemo()
    );
  }
}


class BottomNavigationBarDemo extends StatefulWidget {
  _BottomNavigationBarDemoState createState() => new _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State {
  final bodyList = [
    Container(color: Colors.green,),
    Container(color: Colors.cyan,),
    Container(color: Colors.orange,),
    Container(color: Colors.pink,),
  ];
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Tabbar demo'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('Home', style: TextStyle(color: Colors.blue)), icon: Icon(Icons.home, color: Colors.blue,)),
          BottomNavigationBarItem(title: Text('Search', style: TextStyle(color: Colors.blue)), icon: Icon(Icons.search, color: Colors.blue,)),
          BottomNavigationBarItem(title: Text('Friends', style: TextStyle(color: Colors.blue)), icon: Icon(Icons.face, color: Colors.blue,)),
          BottomNavigationBarItem(title: Text('Profile', style: TextStyle(color: Colors.blue)), icon: Icon(Icons.settings, color: Colors.blue,)),
        ],
        currentIndex: currentIdx,

        onTap: (index){
          // 更新状态，重新刷新UI
          setState(() {
            // 修改全局变量currentIdx的值
            currentIdx = index;
          });
        },

      ),

      body: bodyList[currentIdx],
    );
  }
}