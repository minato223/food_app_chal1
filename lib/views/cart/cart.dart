import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_chal1/constants/app_colors.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/models/cart_model.dart';
import 'package:food_app_chal1/providers/cart_provider.dart';
import 'package:food_app_chal1/views/common/bottom_action_sheet.dart';
import 'package:food_app_chal1/views/common/change_quantity_widget.dart';
import 'package:food_app_chal1/views/common/custom_app_bar.dart';
import 'package:food_app_chal1/widgets/app_icon.dart';
import 'package:food_app_chal1/widgets/outlined_icon_button.dart';
import 'package:food_app_chal1/widgets/xspace.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: OutlinedIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderColor: AppColors.textColor,
                  child: SvgPicture.asset(
                    AppIcons.arrowLeft,
                    color: Colors.black54,
                  )),
              title: "Cart Detail",
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  List<CartModel> list = value.getCartList;
                  double total = 0;
                  try {
                    total = list
                        .map((e) => (e.food.price * e.quantity))
                        .reduce((value, element) => value + element);
                    // ignore: empty_catches
                  } catch (e) {}
                  return value.getCartList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcon(
                              path: AppIcons.cart,
                              size: size.WIDTH * .4,
                            ),
                            Text('Empty Cart.',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w800))
                          ],
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.all(size.CONTENT_SPACE),
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  ...List.generate(list.length, (index) {
                                    CartModel cartModel = list[index];
                                    return TweenAnimationBuilder(
                                      tween: Tween<double>(begin: .4, end: 1),
                                      duration:
                                          const Duration(milliseconds: 600),
                                      builder: (context, v, child) {
                                        return Opacity(
                                          opacity: v,
                                          child: Container(
                                            padding: EdgeInsets.all(
                                                size.CONTENT_SPACE * .5),
                                            margin: EdgeInsets.only(
                                                bottom: size.CONTENT_SPACE),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(5, 5),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                  )
                                                ]),
                                            child: Column(
                                              children: [
                                                IntrinsicHeight(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              size.WIDTH * .25,
                                                          child:
                                                              Transform.scale(
                                                                  scale: v,
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                AssetImage(cartModel.food.image),
                                                                            fit: BoxFit.cover)),
                                                                  ))),
                                                      XSpace(size.CONTENT_SPACE)
                                                          .x,
                                                      Expanded(
                                                          child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    size.CONTENT_SPACE /
                                                                        2),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                cartModel
                                                                    .food.name,
                                                                style: theme
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w900)),
                                                            XSpace(size.CONTENT_SPACE *
                                                                    .8)
                                                                .y,
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    'Additional menu : ',
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleSmall!
                                                                        .copyWith(
                                                                      color: AppColors
                                                                          .textColor,
                                                                    )),
                                                                Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: cartModel
                                                                            .menus
                                                                            ?.map((e) =>
                                                                                Text(e.name, style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w900)))
                                                                            .toList() ??
                                                                        [])
                                                              ],
                                                            ),
                                                            XSpace(size.CONTENT_SPACE *
                                                                    .8)
                                                                .y,
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      style: theme
                                                                          .textTheme
                                                                          .titleMedium,
                                                                      children: <
                                                                          TextSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                "\$${cartModel.food.price}",
                                                                            style:
                                                                                theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w900)),
                                                                        TextSpan(
                                                                            text:
                                                                                ' \$${cartModel.food.promotionPrice}',
                                                                            style: theme.textTheme.titleSmall!.copyWith(
                                                                                decoration: TextDecoration.lineThrough,
                                                                                color: AppColors.textColor,
                                                                                fontWeight: FontWeight.bold)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                ChangeQuantity(
                                                                  initialValue:
                                                                      cartModel
                                                                          .quantity,
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                XSpace(size.CONTENT_SPACE * 1.5)
                                                    .y,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            size.CONTENT_SPACE *
                                                                .3),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .textColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                        child: Row(
                                                          children: [
                                                            AppIcon(
                                                              path: AppIcons
                                                                  .copyLink,
                                                              color: AppColors
                                                                  .textColor,
                                                            ),
                                                            XSpace(size.CONTENT_SPACE /
                                                                    2)
                                                                .x,
                                                            Expanded(
                                                              child: Text(
                                                                  cartModel.food
                                                                          .description ??
                                                                      'Spicy Chiken Teriyaki Proident magna ullamco laboris nisi.',
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                          color: AppColors
                                                                              .textColor,
                                                                          fontWeight:
                                                                              FontWeight.w800)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:
                                                            OutlinedIconButton(
                                                                onTap: () {
                                                                  value.removeFromCart(
                                                                      cartModel);
                                                                },
                                                                borderColor:
                                                                    AppColors
                                                                        .textColor,
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 1.3,
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .restore_from_trash_sharp,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                )),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList()
                                ],
                              ),
                            ),
                            BottomActionSheet(
                              subtitle: "\$${total.toStringAsExponential(2)}",
                              onClick: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Checkout successfully ;)",
                                    style:
                                        TextStyle(color: AppColors.greenColor),
                                  ),
                                  backgroundColor: Colors.white,
                                ));
                              },
                              buttonTitle: "Checkout",
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
