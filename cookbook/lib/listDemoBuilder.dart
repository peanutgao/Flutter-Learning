/**
 * 长列表用于根据数据源显示
 */
import 'package:flutter/material.dart';

class LongListViewDemo extends StatelessWidget {
  // 数据源
  final List<String> items;

  LongListViewDemo({Key key, @required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return new ListTile(
          title: Text('${items[index]}'),
        );
      },
    );
  }
}