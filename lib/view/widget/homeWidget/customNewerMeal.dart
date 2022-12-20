import 'package:beeorder/controller/HomeScreen/homeController.dart';
import 'package:beeorder/core/class/handlingData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/function/isNewfun.dart';
import '../../../data/model/mealModel.dart';
import '../publicwidget/mealCard.dart';
class CustomNewerMeal extends GetView<HomeControllerImp> {
  const CustomNewerMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HandlingDataViewShimmer(
            statusRequest: controller.statusRequest ,
            widget: Container(
              margin: const EdgeInsets.all(6) ,
              height: 200                     ,
              child: ListView.builder(
            scrollDirection: Axis.horizontal                ,
            itemCount      : controller.listOfMeal.length   ,
            itemBuilder    : (context, index) {
              if(isNewFun(MealModel.fromJson(controller.listOfMeal[index]).mealDate!)) {
                return MealCard(
                  mealModel: MealModel.fromJson(controller.listOfMeal[index]),
                  canFavorite: true,
                )  ;
              }else{
                return Container() ;
              }
            },
          ) ,
        ) );
      }
    ) ;
  }
}