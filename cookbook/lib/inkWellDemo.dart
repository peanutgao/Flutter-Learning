/**
 * InkWell组件： 长按有水波纹效果
 */
import 'package:flutter/material.dart';

class InkWellDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new InkWell(
        /** InkWell组件添加点击事件 */
        onTap: (){
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('tap'),
          ));
        },
        child: new Container(
          padding: new EdgeInsets.all(12.0),
          child: new Text('flat button'),
        ),
      ),
    );
  }
}