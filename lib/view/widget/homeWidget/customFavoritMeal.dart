import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/HomeScreen/homeController.dart';
import '../../../core/class/handlingData.dart';
import '../../../data/model/mealModel.dart';
import '../publicwidget/mealCard.dart';

class CustomFavoritMeal extends GetView<HomeControllerImp> {
  const CustomFavoritMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HandlingDataViewShimmer(
              statusRequest: controller.statusRequest ,
              widget: Container(
                margin: const EdgeInsets.all(6),
                height: 200  ,
                child: ListView.builder(
                  scrollDirection:Axis.horizontal           ,
                  itemCount: controller.listOfMeal.length   ,
                  itemBuilder: (context, index) {
                    return MealModel.fromJson(controller.listOfMeal[index]).favorite=='1'?
                      MealCard(
                      mealModel: MealModel.fromJson(controller.listOfMeal[index]),
                        canFavorite: true  ,
                    ):const Text('') ;
                  },
                ) ,
              ) );
        }
    );
  }
}
