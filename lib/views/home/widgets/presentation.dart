import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app_chal1/constants/app_icons.dart';
import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/constants/app_sizes.dart';
import 'package:food_app_chal1/widgets/xspace.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  late final Timer timer;
  final Duration duration = const Duration(milliseconds: 600);

  final images = [
    AppImages.food10,
    AppImages.food12,
    AppImages.food3,
  ];

  final texts = [
    "Good price for\nyour breakfast !",
    "Apolo chicken\nPak Sugar",
    "Bean-Centered\nDishes",
  ];

  int _index = 0;
  List<String> iconList = [
    AppIcons.home,
    AppIcons.copyLink,
    AppIcons.star,
    AppIcons.ticket,
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() => _index++);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.CONTENT_SPACE / 2, horizontal: size.CONTENT_SPACE),
      height: size.WIDTH * .4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AnimatedSwitcher(
              duration: duration,
              child: Image.asset(
                images[_index % images.length],
                fit: BoxFit.cover,
                height: size.WIDTH * .4,
                key: UniqueKey(),
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(stops: [
                  .3,
                  .5,
                  .7
                ], colors: [
                  Color.fromARGB(233, 0, 0, 0),
                  Color.fromARGB(188, 0, 0, 0),
                  Colors.transparent
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: size.WIDTH * .7,
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: FittedBox(
                    child: AnimatedSwitcher(
                        duration: duration,
                        transitionBuilder: (child, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(-1, 0),
                                    end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeOutCirc))
                                .animate(animation),
                            child: AnimatedOpacity(
                              opacity: (-1 + animation.value) * (-1),
                              duration: duration,
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          texts[_index % texts.length].toUpperCase(),
                          style: theme.textTheme.headline5!.copyWith(
                              height: 1.4,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          key: UniqueKey(),
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      style: theme.textTheme.titleMedium,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Discount up to',
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: Colors.white38)),
                        TextSpan(
                            text: ' 50%',
                            style: theme.textTheme.titleMedium!.copyWith(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                XSpace(size.CONTENT_SPACE / 2).y
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, .9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                double ratio = 8;
                bool active = index == _index % images.length;

                return AnimatedContainer(
                  duration: duration,
                  margin: EdgeInsets.symmetric(horizontal: ratio / 3),
                  height: ratio,
                  width: ratio * (active ? 3 : 1),
                  decoration: BoxDecoration(
                      color: active
                          ? Colors.white
                          : const Color.fromARGB(167, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
