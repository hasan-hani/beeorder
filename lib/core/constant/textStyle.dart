import 'package:flutter/material.dart';

import 'appImage.dart';

class AppStyle {
  static TextStyle mealTextStyle = const TextStyle(fontSize: 20);
  static Decoration backgroundImage = BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AppImage.backgroundImage)));
}
