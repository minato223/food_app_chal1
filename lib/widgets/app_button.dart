// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';

class AppButton extends StatelessWidget {
  Function()? onTap;
  String? text;
  Color? background;
  Color? color;
  BorderRadiusGeometry? borderRadius;
  AppButton(
      {super.key,
      this.onTap,
      this.text,
      this.color,
      this.background,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
          decoration: BoxDecoration(
              color: background ?? Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(30)),
          alignment: Alignment.center,
          child: Text(
            text ?? "Button",
            style: theme.textTheme.titleMedium!.copyWith(
                color: color ?? Colors.white, fontWeight: FontWeight.w800),
          ),
        ));
  }
}
