import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/textStyle.dart';
import '../../../core/function/translateFun.dart';
class RowPriceAndTitle extends GetView<MealDetailsControllerImp> {
  const RowPriceAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealDetailsControllerImp>(
      builder: (controller) {
        return Container(
          margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${controller.mealModel.mealPrice}ل س',style: AppStyle.mealTextStyle,),
              Text(translate(ar:controller.mealModel.mealName.toString(),en:controller.mealModel.mealNameEn.toString())    ,style: AppStyle.mealTextStyle,) ,
            ],
          ),
        );
      }
    );
  }
}
