import 'package:flutter/cupertino.dart';

class BottomNavigationItemModel {
  Widget target;
  Function()? onClick;
  BottomNavigationItemModel({required this.target, this.onClick});
}
