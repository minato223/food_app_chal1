// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/fixtures/food_fixtures.dart';
import 'package:food_app_chal1/models/food_model.dart';
import 'package:food_app_chal1/views/food-detail/food_detail.dart';
import 'package:food_app_chal1/views/home/widgets/categories.dart';
import 'package:food_app_chal1/views/home/widgets/presentation.dart';
import 'package:food_app_chal1/views/home/widgets/search_bar.dart';
import 'package:food_app_chal1/views/merchant-detail/merchant_detail.dart';
import 'package:food_app_chal1/widgets/app_grid_view.dart';
import 'package:food_app_chal1/widgets/app_icon.dart';
import 'package:food_app_chal1/widgets/xspace.dart';
import 'package:food_app_chal1/tools/extensions/context_ext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<String> iconList = [
    AppIcons.home,
    AppIcons.copyLink,
    AppIcons.star,
    AppIcons.ticket,
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: kToolbarHeight * 1.5,
        title: SizedBox(
            height: kToolbarHeight,
            width: size.WIDTH * .65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Your location",
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: AppColors.textColor),
                ),
                Text(
                  "Minato Namikaze, Konohagakure",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.CONTENT_SPACE),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatar),
              radius: 25,
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SearchBar(),
          const Presentation(),
          const Categories(),
          Padding(
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Recommended",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w900)),
                InkWell(
                  onTap: () {
                    context.pushRoute(const MerchantDetail());
                  },
                  child: Text("View all",
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.greenColor)),
                )
              ],
            ),
          ),
          XSpace(size.CONTENT_SPACE / 2).y,
          AppGridView(
              crossAxisCount: 2,
              crossAxisSpacing: size.CONTENT_SPACE,
              mainAxisSpacing: size.CONTENT_SPACE * 1.5,
              padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
              children: List.generate(4, (index) {
                FoodModel food = FoodFixtures.foods[index];
                return InkWell(
                  onTap: () {
                    context.pushRoute(FoodDetail(item: food));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.WIDTH * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(food.image))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.CONTENT_SPACE * .6),
                        child: Text(food.name,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w900, height: 1.5)),
                      )
                    ],
                  ),
                );
              }))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: iconList
                .asMap()
                .entries
                .map((entry) => InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = entry.key;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppIcon(
                            path: entry.value,
                            size: size.CONTENT_SPACE * 1.5,
                          ),
                          XSpace(size.CONTENT_SPACE / 2).y,
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.decelerate,
                            height: 3,
                            width: entry.key == _currentIndex
                                ? size.CONTENT_SPACE
                                : 0,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
