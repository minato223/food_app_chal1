// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/fixtures/food_fixtures.dart';
import 'package:food_app_chal1/models/bottom_navigation_item_model.dart';
import 'package:food_app_chal1/models/food_model.dart';
import 'package:food_app_chal1/providers/cart_provider.dart';
import 'package:food_app_chal1/views/cart/cart.dart';
import 'package:food_app_chal1/views/food-detail/food_detail.dart';
import 'package:food_app_chal1/views/home/widgets/categories.dart';
import 'package:food_app_chal1/views/home/widgets/presentation.dart';
import 'package:food_app_chal1/views/home/widgets/search_bar.dart';
import 'package:food_app_chal1/views/merchant-detail/merchant_detail.dart';
import 'package:food_app_chal1/widgets/app_grid_view.dart';
import 'package:food_app_chal1/widgets/app_icon.dart';
import 'package:food_app_chal1/widgets/fade_slide_animation.dart';
import 'package:food_app_chal1/widgets/xspace.dart';
import 'package:food_app_chal1/tools/extensions/context_ext.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  double startDuration = 300;
  List<String> iconList = [
    AppIcons.pentagone,
    AppIcons.wallet,
    AppIcons.heart,
  ];
  // AppIcons.cart,

  late List<BottomNavigationItemModel> navList = [];

  Duration getDuration(double delay) =>
      Duration(milliseconds: (startDuration * delay).toInt());

  @override
  void initState() {
    super.initState();
    navList = [
      ...iconList
          .asMap()
          .entries
          .map((e) => BottomNavigationItemModel(
              onClick: () {
                setState(() {
                  _currentIndex = e.key;
                });
              },
              target: AppIcon(
                path: e.value,
              )))
          .toList(),
      BottomNavigationItemModel(onClick: () {
        context.pushRoute(const Cart());
      }, target: Consumer<CartProvider>(builder: (context, value, child) {
        return Stack(
          alignment: const Alignment(1, -5),
          children: [
            AppIcon(
              path: AppIcons.cart,
            ),
            value.getCartList.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      value.getCartList.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                : XSpace(0).x
          ],
        );
      }))
    ];
  }

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
          FadeSlideAnimation(
              direction: FadeAnimationDirection.bottom,
              duration: getDuration(1),
              child: const SearchBar()),
          FadeSlideAnimation(
              direction: FadeAnimationDirection.bottom,
              duration: getDuration(2),
              child: const Presentation()),
          FadeSlideAnimation(
              direction: FadeAnimationDirection.bottom,
              duration: getDuration(3),
              child: const Categories()),
          FadeSlideAnimation(
              direction: FadeAnimationDirection.bottom,
              child: Padding(
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
              )),
          XSpace(size.CONTENT_SPACE / 2).y,
          FadeSlideAnimation(
              duration: getDuration(5),
              direction: FadeAnimationDirection.bottom,
              child: AppGridView(
                  crossAxisCount: 2,
                  crossAxisSpacing: size.CONTENT_SPACE,
                  mainAxisSpacing: size.CONTENT_SPACE * 1.5,
                  padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
                  children: List.generate(4, (index) {
                    FoodModel food = FoodFixtures.foods[index];
                    double bottomOffset = size.CONTENT_SPACE * 4;
                    int duration = 500;
                    return TweenAnimationBuilder(
                        curve: Curves.decelerate,
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(
                            milliseconds: duration + (duration * index)),
                        builder: ((context, value, child) {
                          double y = (value - 1) * (-1) * bottomOffset;
                          return Transform.translate(
                              offset: Offset(0, y),
                              child: InkWell(
                                onTap: () {
                                  context.pushRoute(FoodDetail(item: food));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.WIDTH * .5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(food.image))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          size.CONTENT_SPACE * .6),
                                      child: Text(food.name,
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.titleSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  height: 1.5)),
                                    )
                                  ],
                                ),
                              ));
                        }));
                  })))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navList
                .asMap()
                .entries
                .map((nav) => InkWell(
                      onTap: nav.value.onClick,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          nav.value.target,
                          XSpace(size.CONTENT_SPACE / 2).y,
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.decelerate,
                            height: 3,
                            width: nav.key == _currentIndex
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
