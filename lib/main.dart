import 'package:flutter/material.dart';
import 'package:food_app_chal1/providers/cart_provider.dart';
import 'package:food_app_chal1/views/home/home.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
        child: const Home(),
      ),
    );
  }
}
