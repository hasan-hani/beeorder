import 'package:beeorder/controller/HomeScreen/offerController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../../../core/class/handlingData.dart';
import '../../../core/constant/apiLink.dart';
import '../../../core/constant/appColor.dart';
import '../../../data/model/mealModel.dart';
import '../../screen/mealDetailsScreen.dart';
import '../publicwidget/mealCard.dart';
class OfferMeals extends GetView<OfferControllerImp> {
  const OfferMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferControllerImp>(
        builder: (controller) {
          return Expanded(
            child: HandlingDataViewShimmer(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.meals.length,
                  itemBuilder: (context, index) {
                    return MealCard(
                      mealModel : MealModel.fromJson(controller.meals[index]),
                      isExpanded: true    ,
                      canFavorite: false  ,
                    )  ;
                  },
                )
            ),
          );
        }
    );
  }
}