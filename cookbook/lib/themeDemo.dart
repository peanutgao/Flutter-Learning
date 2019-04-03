import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';
    
    return new MaterialApp(
      title: appName,
      /*
      * 设置应用的主题，
      *
      * 设置后再用 Theme.of(context)函数 来使用主题的样式
      * */
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      
      home: MyhomePage(titleString: appName),
      
    );
  }
}


class MyhomePage extends StatelessWidget {
  final String titleString;
  
  MyhomePage({Key key, @required this.titleString}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(titleString),
      ),
      
      body: new Center(
        child: new Container(
          /*
          * Theme.of(context)将查找Widget树并返回树中"最近"的Theme。
          * 如果我们的Widget之上有一个单独的Theme定义，则返回该值。
          * 如果不是，则返回App主题
          * */
          color: Theme.of(context).accentColor,
          child: new Text(
            'Hello world',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),

      /*
      * 设置局部的主题
      * */
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.add),
          )
      ),
    );
  }
}