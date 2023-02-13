import 'package:flutter/material.dart';
import 'package:food_app_chal1/views/cart/cart.dart';
import 'package:food_app_chal1/views/food-detail/food_detail.dart';
import 'package:food_app_chal1/views/home/home.dart';
import 'package:food_app_chal1/views/merchant-detail/merchant_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Comfortaa"),
      home: const Home(),
    );
  }
}
