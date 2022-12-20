import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/appColor.dart';
import '../../../core/constant/textStyle.dart';
class CountNumberOfMeal extends GetView<MealDetailsControllerImp> {
  const CountNumberOfMeal({Key? key}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100  ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton( icon: const Icon(Icons.add,color: AppColor.primaryColor,)
            ,onPressed: () {
            controller.increaseOrderCountFun()   ;
            },)    ,
          GetBuilder<MealDetailsControllerImp>(
            builder: (controller) {
              return Text(
                controller.countOfOrder.toString(),
                style: AppStyle.mealTextStyle,)  ;
            }
          )         ,
          IconButton( icon: const Icon(Icons.minimize_rounded,color: AppColor.primaryColor,) ,
            onPressed: () { controller.decreaseOrderCountFun() ; })
        ],
      ),
    );
  }
}
