import 'package:flutter/material.dart';
import 'page1.dart';


void main() => new MyApp();


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 静态路由注册
      /// 静态路由不能在页面间传递参数
      routes: <String, WidgetBuilder> {
        // Google建议给根目录注册
        '/': (context){return MyApp();},

        // '/page1': (context) => new MyApp();
        '/page1': (context){return Page1();}
      },


      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),

        body: Container(
          color: Colors.blue,
//          child: FloatingActionButton(
//            onPressed: (){
//              /// 静态路由跳转方式1
//              /// 这种方式不接收返回的参数
//              /// Navigator.of(context).pushNamed('/page1');
//
//              /// 静态路由跳转方式2
//              /// 如果要接收参数的话，调用then方法，参数是一个带有返回值的函数
//              Navigator.of(context).pushNamed('/page1').then((onValue){
//                print(onValue);
//              });
//            },
//          ),
        ),
      ),
    );
  }
}
