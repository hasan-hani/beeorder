import 'package:beeorder/core/class/searchResturantMeal/serchDelegateController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'  ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/model/mealModel.dart';
import '../../../../data/model/resturantModel.dart';
import '../../../../view/screen/mealDetailsScreen.dart';
import '../../../../view/widget/publicwidget/mealCard.dart';
import '../../../../view/widget/resturantWidget/resturantCard.dart';
import '../../../constant/apiLink.dart';
import '../../../constant/appColor.dart';

class ResultResOrMeal extends GetView<SearchDelegateControllerImp> {
  const ResultResOrMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDelegateControllerImp());
    return Expanded(
      child: GetBuilder<SearchDelegateControllerImp>(
        builder: (controller) {
          return IndexedStack(
            index: controller.selectedResMeal ,
            children: [
              ListView.builder(
                itemCount: controller.meals.length ,
                itemBuilder: (context, index) {
                  return MealCard(
                    isExpanded: true  ,
                    mealModel: MealModel.fromJson(controller.meals[index]),
                    canFavorite: false ,
                  );
                },),
              ListView.builder(
                itemCount: controller.restaurants.length ,
                itemBuilder: (context, index) {
                  return ResturantCard(
                      canFav: false ,
                      restaurantModel: RestaurantModel.fromJson(controller.restaurants[index])
                  );
                },),
            ],
          );
        }
      ),
    )             ;
  }
}

