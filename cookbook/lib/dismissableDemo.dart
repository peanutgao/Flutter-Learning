/**
 * Dismissable组件用于滑动关闭操作
 */
import 'package:flutter/material.dart';

class DismissableDemo extends StatelessWidget {

  final items = new List<String>.generate(20, (i) => 'Item ${i}');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          final item = items[index];

          return new Dismissible(
            /// Dismissible组件必须要包含一个 key，用来区分组件
            key: new Key(item),
 
            /// 被删除的时候的操作内容
            /// 可以左滑也可以右滑动
            onDismissed: (dirction) {
              if (dirction == DismissDirection.endToStart) {
                print("从右到左滑动删除");
                items.removeAt(index);

                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('$item 被删除了'),)
                );
              }
              
            },

            background: new Container(color: Colors.red,),
            // 设置 ListView的cell
            child: new ListTile(
              title: new Text('$item'),
            ),
          );
        },
      ),
    );
  }
}