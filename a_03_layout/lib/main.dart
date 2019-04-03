import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Helo'),
        ),
        
        body: new RowLayout()
//        body: new columnLayout(),
      ),
    );
  }
}

/*
* Row 横向布局
* */
class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(

      child: Container(
        color: Colors.red,

        /*
        * 当控件太大的时候会超出边界，显示会出问题，
        * 可以使用 Expanded 组件包装子组件，以适应尺寸。
        * Expanded有 flex属性，用于设定弹性系数，默认弹性系数是1
        * */
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
//            new Image.asset('images/duck.png',),
//            new Image.asset('images/duck.png',),
//            new Image.asset('images/duck.png',),

            new Expanded(
                child: new Image.asset('images/duck.png',)
            ),

            new Expanded(
              child: new Image.asset('images/duck.png'),

              // 设置 弹性系数为 2， 默认是1
              flex: 2,
            ),

            new Expanded(
                child: new Image.asset('images/duck.png'),
            )
          ],

        ),
      )
    );
  }
}


class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: Colors.red,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Image.asset('images/duck.png',width: 100.0, height: 100.0,),
            Image.asset('images/duck.png',width: 100.0, height: 100.0,),
            Image.asset('images/duck.png',width: 100.0, height: 100.0,),
          ],
        ),
      ),
    );
  }
}