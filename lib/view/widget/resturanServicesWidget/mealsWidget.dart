import 'package:beeorder/controller/resturant/ResturantServicesController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'   ;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart'            ;

import '../../../core/constant/apiLink.dart';
import '../../../core/constant/appColor.dart';
import '../../../data/model/mealModel.dart';
import '../../screen/mealDetailsScreen.dart';
import '../../../core/class/handlingData.dart';
import '../publicwidget/mealCard.dart';
class MealsWidget extends GetView<RestaurantServicesControllerImp> {
  const MealsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantServicesControllerImp>(
      builder: (controller) {
        return Expanded(
          child: HandlingDataViewShimmer(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.meals.length,
                itemBuilder: (context, index) {
                  return MealCard(
                    isExpanded: true,
                    mealModel : MealModel.fromJson(controller.meals[index]),
                    canFavorite: false,

                  ) ;
                },
              )),
        );
      }
    );
  }
}
class _MealCard extends StatelessWidget {
  final MealModel mealModel ;
  const _MealCard({Key? key, required this.mealModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(MealDetailsScreen.id , arguments: {'MealModel':mealModel}) ;
      },
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 125,
            child: Hero(
              tag: mealModel.mealId.toString(),
              child: CachedNetworkImage(
                height: 125,
                width: double.maxFinite,
                imageUrl: '${ApiLink.imageLinkMeal}/${mealModel.mealImage}',
                fit: BoxFit.fill   ,
              ),
            ),
          )  ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Column(
              children: [
                Text(mealModel.mealName.toString())     ,
                Text(mealModel.mealDesc.toString())     ,
              ],
            ) ,
            Text(mealModel.mealPrice.toString()+' ل س',style: TextStyle(color: AppColor.primaryColor),)
          ],)
        ],
      ),
    );
  }
}

