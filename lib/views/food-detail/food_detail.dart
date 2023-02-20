// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/fixtures/food_fixtures.dart';
import 'package:food_app_chal1/models/cart_model.dart';
import 'package:food_app_chal1/models/food_menu_model.dart';
import 'package:food_app_chal1/models/food_model.dart';
import 'package:food_app_chal1/providers/cart_provider.dart';
import 'package:food_app_chal1/views/common/bottom_action_sheet.dart';
import 'package:food_app_chal1/views/common/change_quantity_widget.dart';
import 'package:food_app_chal1/widgets/outlined_icon_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';
import 'package:provider/provider.dart';

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
  late CartProvider cartProvider;
  late final Timer timer;
  int _index = 0;
  int quantity = 1;
  final Duration duration = const Duration(milliseconds: 600);
  final images = [
    AppImages.food2,
    AppImages.food3,
  ];
  @override
  void initState() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    images.add(widget.item.image);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() => _index++);
      }
    });
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

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  double getTotalAmount() {
    double sup = 0;
    var currentMenus = additionalMenu
        .where((element) => element['state'])
        .map((e) => e['item'])
        .toList();
    if (currentMenus.isNotEmpty) {
      sup = currentMenus
          .map((e) => e.price)
          .toList()
          .reduce((value, element) => value + element);
    }
    return (quantity * widget.item.price) + sup;
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
    var foodMenus = additionalMenu
        .where((element) => element['state'])
        .map((e) => e['item'])
        .toList();
    List<FoodMenuModel> menus = [];
    for (var element in foodMenus) {
      if (element is FoodMenuModel) {
        menus.add(element);
      }
    }
    CartModel cartModel =
        CartModel(food: widget.item, quantity: quantity, menus: menus);
    cartProvider.addToCart(cartModel);
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
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: OutlinedIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.arrowLeft,
                        color: Colors.white,
                      )),
                  leadingWidth: 0,
                  leading: XSpace(0).x,
                  pinned: true,
                  backgroundColor: AppColors.greenColor,
                  expandedHeight: size.HEIGHT * .3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        AnimatedSwitcher(
                          duration: duration,
                          child: Image.asset(
                            images[_index % images.length],
                            height: size.HEIGHT * .35,
                            fit: BoxFit.fill,
                            key: UniqueKey(),
                            width: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: size.CONTENT_SPACE),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(images.length, (index) {
                                bool active = index == _index % images.length;
                                return AnimatedContainer(
                                  duration: duration,
                                  width: size.CONTENT_SPACE * 2.5,
                                  height: 4,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.CONTENT_SPACE * .3),
                                  decoration: BoxDecoration(
                                      color: active
                                          ? Colors.white
                                          : Colors.white38),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(size.CONTENT_SPACE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          .copyWith(
                                              fontWeight: FontWeight.w900)),
                                  XSpace(size.CONTENT_SPACE * .8).y,
                                  Text(
                                      '\$${widget.item.price.toStringAsFixed(2)}',
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
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
                          padding: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE),
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
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE),
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
                                    Text(
                                        '\$${e["item"].price.toStringAsFixed(2)}',
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(
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
                          margin: EdgeInsets.symmetric(
                              vertical: size.CONTENT_SPACE),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                              'Fugiat nostrud voluptate consectetur velit amet ullamco pariatur qui duis ullamco magna elit.',
                              style: theme.textTheme.bodySmall!.copyWith(
                                  color: AppColors.textColor, height: 2)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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
                      ChangeQuantity(
                        onChange: (value) {
                          setState(() {
                            quantity = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                BottomActionSheet(
                  subtitle: "\$${getTotalAmount().toStringAsFixed(2)}",
                  onClick: addItemToCart,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
