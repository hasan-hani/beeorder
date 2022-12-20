import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:flutter/material.dart'   ;
import 'package:get/get.dart';

import '../../../core/constant/textStyle.dart';
import '../../../core/function/translateFun.dart';
class MealDescription extends GetView<MealDetailsControllerImp> {
  const MealDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealDetailsControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          child:Text(
            translate(
              ar: controller.mealModel.mealDesc  .toString(),
              en: controller.mealModel.mealDescEn.toString()
          ),
            style: AppStyle.mealTextStyle,)
        );
      }
    );
  }
}
