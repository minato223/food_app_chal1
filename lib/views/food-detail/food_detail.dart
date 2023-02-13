// ignore_for_file: must_be_immutable

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/fixtures/food_fixtures.dart';
import 'package:food_app_chal1/models/food_menu_model.dart';
import 'package:food_app_chal1/models/food_model.dart';
import 'package:food_app_chal1/views/common/bottom_action_sheet.dart';
import 'package:food_app_chal1/views/common/change_quantity_widget.dart';
import 'package:food_app_chal1/widgets/outlined_icon_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class FoodDetail extends StatefulWidget {
  FoodModel item;
  FoodDetail({super.key, required this.item});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scaleAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1.3), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1), weight: 2),
    ]).chain(CurveTween(curve: Curves.ease)).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .chain(CurveTween(curve: Curves.ease))
        .animate(animationController);
    super.initState();
  }

  List<Map<String, dynamic>> additionalMenu =
      FoodFixtures.foodMenuList.map((e) {
    Map<String, dynamic> menu = {};
    menu["item"] = e;
    menu["state"] = false;
    return menu;
  }).toList();

  toggleMenu(FoodMenuModel menu, bool? value) {
    var currentMenu =
        additionalMenu.firstWhere((element) => element["item"] == menu);
    int currentMenuIndex = additionalMenu.indexOf(currentMenu);
    Map<String, dynamic> newMenu = {
      "item": currentMenu["item"],
      "state": value
    };
    setState(() {
      additionalMenu
          .replaceRange(currentMenuIndex, currentMenuIndex + 1, [newMenu]);
    });
  }

  addItemToCart() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Item added to cart",
        style: TextStyle(color: AppColors.greenColor),
      ),
      backgroundColor: Colors.white,
    ));
  }

  likeFood() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    }
    if (animationController.status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.HEIGHT * .4,
            width: size.WIDTH,
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.item.image), fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: const Alignment(-1, -.8),
                child: OutlinedIconButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.arrowLeft,
                      color: Colors.white,
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      width: size.CONTENT_SPACE * 2.5,
                      height: 4,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.CONTENT_SPACE * .3),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2),
                          color: index == 0 ? Colors.white : Colors.white38),
                    );
                  }),
                ),
              )
            ]),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.item.name,
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w900)),
                        XSpace(size.CONTENT_SPACE * .8).y,
                        Text('\$${widget.item.price}',
                            style: theme.textTheme.titleMedium!.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: ((context, child) {
                        return OutlinedIconButton(
                            onTap: likeFood,
                            borderColor: Colors.black26,
                            ratio: size.CONTENT_SPACE * 2.9,
                            child: Transform.scale(
                              scale: scaleAnimation.value,
                              child: Icon(
                                Icons.favorite,
                                // color: Colors.red,
                                color: colorAnimation.value,
                              ),
                            ));
                      }))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                child: DottedLine(
                  dashColor: AppColors.textColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Additional menu',
                      style: theme.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w900)),
                  XSpace(size.CONTENT_SPACE * .5).y,
                  Text('Optional, can choose more than one',
                      style: theme.textTheme.titleSmall!.copyWith(
                          color: Colors.black38, fontWeight: FontWeight.w800))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                child: Column(
                    children: additionalMenu.map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(e['item'].name,
                          style: theme.textTheme.titleSmall!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w900)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('\$${e["item"].price}',
                              style: theme.textTheme.titleSmall!.copyWith(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w900)),
                          // XSpace(size.CONTENT_SPACE / 2).x,
                          Checkbox(
                            activeColor: AppColors.greenColor,
                            value: e["state"],
                            onChanged: (t) {
                              toggleMenu(e["item"], t);
                            },
                          ),
                        ],
                      )
                    ],
                  );
                }).toList()
                    // List.generate(3, (index) ),
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.CONTENT_SPACE),
                child: DottedLine(
                  dashColor: AppColors.textColor,
                ),
              ),
              Text('Note to seller',
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w900)),
              Container(
                padding: EdgeInsets.all(size.CONTENT_SPACE),
                margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                    'Fugiat nostrud voluptate consectetur velit amet ullamco pariatur qui duis ullamco magna elit.',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: AppColors.textColor, height: 2)),
              )
            ],
          )),
          SizedBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(size.CONTENT_SPACE),
                  color: Colors.blueGrey[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Order Quantity',
                          style: theme.textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w900)),
                      ChangeQuantity()
                    ],
                  ),
                ),
                BottomActionSheet(
                  onClick: addItemToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
