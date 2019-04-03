import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        // 加载网络图片
        new Image.network('https://tu.jiuwa.net/bg/992.jpg'),

        // Gif图片
        new Image.network('https://www.jiuwa.net/tuku/20180407/ZwmMQSXR.gif'),

        // 占位图
        new FadeInImage.assetNetwork(
            placeholder: 'images/placeholder.png',
            image: 'https://tu.jiuwa.net/bg/992.jpg',
        ),

        new ClipOval(
          child: Image.network(
              'http://www.ghost64.com/qqtupian/zixunImg/local/2018/08/10/15338969758510.jpg',
            scale: 2.5,
          ),
        ),
      ],
    );

  }
}