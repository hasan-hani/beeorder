import 'package:beeorder/controller/resturant/ResturantServicesController.dart';
import 'package:flutter/material.dart'  ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widget/resturanServicesWidget/mealsWidget.dart';
import '../widget/resturanServicesWidget/resturantDetails.dart';
import '../widget/resturanServicesWidget/resturantServicesWidget.dart';
class ResturantServicesScreen extends GetView<RestaurantServicesControllerImp> {
  static String id= '/ResturantDetailsScreen'  ;
  const ResturantServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantServicesControllerImp controller=Get.put(RestaurantServicesControllerImp());
    return  WillPopScope(
      onWillPop: ()async {
        controller.goToHomeScreen() ;
        return false ;
      },
      child: SafeArea(
        child: Scaffold(
          body:  Center(
              child:Column(
                children: [
                  ResturantDetails(
                    restaurantModel: controller.restaurantModel    ,
                    getPosition: controller.goToRestaurantMap       ,
                  )                                    ,
                  const ResturantServicesWidget()      ,
                  const MealsWidget()                  ,

                ],
              )
          ),
        ),
      ),
    ) ;
  }
}
