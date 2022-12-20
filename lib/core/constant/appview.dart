import 'package:flutter/material.dart';

import 'appColor.dart';
import 'appImage.dart';

class AppView{
  //the background image of app
  static  BoxDecoration backgroundImage=BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AppImage.backgroundImage),
          fit: BoxFit.fill
      )
  );
  static UnderlineInputBorder underlineInputBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
  );
  static const TextStyle subTitle = TextStyle(fontSize: 18);
}