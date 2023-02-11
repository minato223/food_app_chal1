// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';

class OutlinedIconButton extends StatelessWidget {
  Widget child;
  Color? borderColor;
  double? ratio;
  Function()? onTap;
  OutlinedIconButton(
      {super.key,
      required this.child,
      this.borderColor,
      this.ratio,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      double r = ratio ?? size.CONTENT_SPACE * 2.3;
      return InkWell(
        onTap: onTap,
        child: Container(
          height: r,
          width: r,
          padding: EdgeInsets.all(size.CONTENT_SPACE / 2),
          decoration: BoxDecoration(
              color: Colors.white24,
              border:
                  Border.all(color: borderColor ?? Colors.white, width: 1.5),
              shape: BoxShape.circle),
          child: FittedBox(child: child),
        ),
      );
    });
  }
}
