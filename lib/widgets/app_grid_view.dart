// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class AppGridView extends StatelessWidget {
  EdgeInsetsGeometry? padding;
  int crossAxisCount;
  double? mainAxisSpacing = 0.0;
  double? crossAxisSpacing = 0.0;
  List<Widget>? children;
  AppGridView(
      {super.key,
      required this.crossAxisCount,
      this.crossAxisSpacing,
      this.mainAxisSpacing,
      this.children,
      this.padding});

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];
    if (children != null) {
      for (var i = 0; i < children!.length; i += crossAxisCount) {
        List<Widget> rowChildren = [];
        for (var j = 0; j < crossAxisCount; j++) {
          int currentIndex = i + j;
          Widget currentWidget;
          if (currentIndex < children!.length) {
            currentWidget = children![currentIndex];
          } else {
            currentWidget = XSpace(0).x;
          }
          rowChildren.add(Expanded(flex: 1, child: currentWidget));
          if (crossAxisCount > 1 && j + 1 < crossAxisCount) {
            rowChildren.add(XSpace(mainAxisSpacing).x);
          }
        }
        Row row = Row(children: rowChildren);
        columnChildren.add(row);
        columnChildren.add(XSpace(crossAxisSpacing).y);
      }
    }
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(children: columnChildren),
    );
  }
}
