import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:beeorder/core/constant/apiLink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingData.dart';

import '../../../core/constant/appColor.dart';

class MealImage extends GetView<MealDetailsControllerImp> {
  const MealImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealDetailsControllerImp>(builder: (controller) {
      return HandlingDataViewShimmer(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.only(top: 2),
            child: Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.maxFinite,
                  child: Hero(
                    tag: controller.mealModel.mealId.toString(),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiLink.imageLinkMeal}/${controller.mealModel.mealImage}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

            controller.canFav? Container(
                  height: 50,
                  color: Colors.white10.withOpacity(0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => controller.goToHomeScreen(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.primaryColor,
                          )),
                      IconButton(
                              onPressed: () {
                                controller.addFavoriteFun();
                              },
                              icon: Icon(
                                controller.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: AppColor.primaryColor,
                              ))
                    ],
                  ),
                ):Container(),
              ],
            ),
          ));
    });
  }
}
