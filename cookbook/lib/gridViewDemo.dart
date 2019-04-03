import 'package:flutter/material.dart';

/**
 * GridView类似iOS中的CollectionView
 */

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      children: new List.generate(100, (idx) {
        return new Center(
          child: new Text(
            'Item${idx}',
            style: Theme.of(context).textTheme.headline,
          ),
        );
      }),
    );
  }
}