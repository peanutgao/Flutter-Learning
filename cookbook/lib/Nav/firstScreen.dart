import 'package:flutter/material.dart';
import '../Nav/secondScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('打开新页面'),
          
          /// 按钮点击启动新页面
          onPressed: (){
            /// 切换需要个Route，可以创建自己的，或直接使用MaterialPageRoute
            /// 安卓和iOS动画效果不同，iOS是push效果
            Navigator.push(
              context, 
              new MaterialPageRoute(builder: (context) => new SecondScreen())
            );
          },
        ),
        
      ),
    );
    
  }
}
