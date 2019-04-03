import 'package:flutter/material.dart';

void main() {
  // 开启可视化调试
  debugProfileBuildsEnabled = true;

  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 创建图片组件
    Widget imageSection = new Image.asset(
      'images/lake.jpg',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    );

    // 设置标题组组件
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      /*
      * - 文字、图标、数字3个是横向布局
      * - 2行文字 按列 布局
      *
      * Row 会将子组件横向布局
      * Column 子组件竖向布局
      * Expanded
      * */
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                // crossAxisAlignment属性会将该列中的子项左对齐
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  /*
                  * Container类似iOS的View，用来自定义Widget
                  * 添加填充，边距，边框或背景色，请使用Container来设置，只有容器有这些属性
                  * */
                  new Container(
                   padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Hello World',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  new Text(
                    'Hello Flutter World',
                    style: new TextStyle(
                      color: Colors.grey[500]
                    ),
                  )
                ],
              )

          ),

          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          new Text(
            '41'
          )
        ],
      ),
    );


    Column buildBottomColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      /*
      * 按钮和文字列向布局
      * */
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }


    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          buildBottomColumn(Icons.call, 'Call'),
          buildBottomColumn(Icons.near_me, 'Route'),
          buildBottomColumn(Icons.share, 'Share'),
        ],
      ),
    );


    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Hello',

      theme: ThemeData(
          primarySwatch: Colors.blue
      ),

      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            imageSection,
            titleSection,
            buttonSection,
            textSection,
          ],
        ), 
      ),
    );

  }
}