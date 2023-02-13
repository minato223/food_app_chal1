// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/outlined_icon_button.dart';

class ChangeQuantity extends StatefulWidget {
  int? initialValue;
  double? iconRatio;
  double? scaleFactor;
  Function(int value)? onChange;
  ChangeQuantity(
      {super.key,
      this.initialValue,
      this.iconRatio,
      this.scaleFactor,
      this.onChange});

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  late int _value;
  late double _scale;
  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? 1;
    _scale = widget.scaleFactor ?? 3.0;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    double iconRatio = size.CONTENT_SPACE * 1.5;
    decrement() {
      if (_value > 1) {
        setState(() {
          _value -= 1;
        });
        if (widget.onChange != null) {
          widget.onChange!(_value);
        }
      }
    }

    increment() {
      setState(() {
        _value += 1;
      });
      if (widget.onChange != null) {
        widget.onChange!(_value);
      }
    }

    return Row(
      children: [
        OutlinedIconButton(
            onTap: increment,
            borderColor: AppColors.greenColor,
            ratio: iconRatio,
            child: Transform.scale(
              scale: _scale,
              child: Icon(
                Icons.add_rounded,
                color: AppColors.greenColor,
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE * .4),
          child: Text(_value.toString(),
              style: theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w800)),
        ),
        OutlinedIconButton(
            onTap: decrement,
            borderColor: AppColors.greenColor,
            ratio: iconRatio,
            child: Transform.scale(
              scale: _scale,
              child: Icon(
                Icons.remove_outlined,
                color: AppColors.greenColor,
              ),
            ))
      ],
    );
  }
}
