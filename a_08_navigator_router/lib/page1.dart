import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),

      body: Center(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop('返回给上个页面的数据');
          },
        ),
      ),
    );
  }
}