import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../constant/appImage.dart';
class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Lottie.asset(AppImage.lottieLoading,fit:BoxFit.fill,height: 200,width: double.maxFinite )
    );
  }
}
SnackbarController loadingSnackBar = Get.snackbar('', 'message',
  messageText: const MyLoading(),duration:const Duration(hours:1 ),
  snackPosition: SnackPosition.BOTTOM
) ;
