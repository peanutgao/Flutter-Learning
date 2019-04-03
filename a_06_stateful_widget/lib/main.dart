import 'package:flutter/material.dart';
import 'selfState.dart';
import 'fatherManageState.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new Center(
//          child: FavoriteWidget(),
//          child: TapboxA(),

        // 创建父类控件
        child: ParentWidget(),
        ),
      ),
    );
  }
}









/*
* 创建有状态的组件需要：
  1. 创建一个继承`StatefulWidget`的Widget类，同时必须要实现 createState函数，返回一个状态对象
  2. 创建一个继承`State`的状态类，这个类必须要实现 build 函数，状态改变的代码在这里实现

  变更状态要调用 setState 函数
* */
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() {
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  /*
  * 调用方式的时候通过 setState函数修改状态
  * */
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorited
              ? new Icon(Icons.star)
              : new Icon(Icons.star_border)),
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}