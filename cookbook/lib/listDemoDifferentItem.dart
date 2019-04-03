/**
 * 一个ListView中有不同的ListItem
 * 通常一个ListItem有一个class
 * 定义一个抽象父类ListItem
 */

import 'package:flutter/material.dart';

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class ListDifferentItemDemo extends StatelessWidget {
  final List<ListItem> items;

  ListDifferentItemDemo({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: this.items.length,
      itemBuilder: (context, index){
        final item = items[index];
        if (item is HeadingItem) {
          return new ListTile(
            title: new Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }
        else if (item is MessageItem) {
          return new ListTile(
            title: new Text(item.sender),
            subtitle: new Text(item.body),
          );
        }
        

      },
    );
  }
}