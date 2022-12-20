import 'package:beeorder/controller/HomeScreen/restaurantController.dart';
import 'package:flutter/material.dart'    ;
import 'package:get/get.dart';
import '../../../core/class/handlingData.dart' ;
import '../../widget/SearchResturant.dart';
import '../../widget/resturantWidget/resturantCard.dart';
import '../../../data/model/resturantModel.dart'        ;
class RestaurantScreen extends GetView<RestaurantControllerImp> {
  const RestaurantScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantControllerImp());
    return GetBuilder<RestaurantControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.all(16),
          child:  Column(
            children: [
              const SearchRestaurunt()  ,
              Expanded(
                child: HandlingDataViewShimmer(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.listOfRestaurant.length,
                      itemBuilder: (context, index) {
                        return ResturantCard(
                            canFav : true  ,
                            restaurantModel:RestaurantModel.fromJson(
                                controller.listOfRestaurant[index]
                            )
                        ) ;
                      },
                    )
                ) ,
              ),
            ],
          ),
        );
      }
    );
  }
}
