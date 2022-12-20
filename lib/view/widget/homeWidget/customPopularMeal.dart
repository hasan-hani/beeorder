import 'package:flutter/material.dart'                          ;
import 'package:get/get.dart'                                   ;
import '../../../controller/HomeScreen/homeController.dart'     ;
import '../../../core/class/handlingData.dart'                  ;
import '../../../core/constant/apiLink.dart';
import '../../../core/constant/appImage.dart'                   ;
import '../../../data/model/mealModel.dart'                     ;
import 'package:cached_network_image/cached_network_image.dart' ;

import '../publicwidget/mealCard.dart';

class CustomPopularMeal extends GetView<HomeControllerImp> {
  const CustomPopularMeal({Key? key}) : super(key: key)    ;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HandlingDataViewShimmer(
          statusRequest: controller.statusRequest          ,
          widget: Container(
          margin: const EdgeInsets.all(6)                  ,
          height: 200                                      ,
          child: ListView.builder(
            scrollDirection:Axis.horizontal                ,
            itemCount: controller.listOfMeal.length        ,
            itemBuilder: (context, index) {
              return MealCard(
                mealModel: MealModel.fromJson(controller.listOfMeal[index] ,),
                canFavorite: true,)                         ;
            },
          ),
        ),
        ) ;
      }
    )   ;
  }
}

