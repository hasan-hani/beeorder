import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controller/splashScreenImage.dart';
import '../../core/constant/appImage.dart';
import '../../core/constant/appview.dart';
class SplashScreen extends GetView<SplashScreenControllerImp> {
  static String id='/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenControllerImp());
    return Scaffold(
      body: Container(
        decoration: AppView.backgroundImage ,
      ),
    );
  }
}
