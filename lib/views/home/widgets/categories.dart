import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    List<String> categories = [
      "🍠 Steak",
      "🥕 Vegetables",
      "🍕 Fast food",
      "🥚 Eggs"
    ];
    return SizedBox(
      height: size.WIDTH * .15,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
        children: categories.map((e) {
          return Container(
              margin: EdgeInsets.only(left: size.CONTENT_SPACE / 2),
              child: Chip(
                  padding: EdgeInsets.all(size.CONTENT_SPACE / 1.5),
                  label: Text(e,
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold))));
        }).toList(),
      ),
    );
  }
}
