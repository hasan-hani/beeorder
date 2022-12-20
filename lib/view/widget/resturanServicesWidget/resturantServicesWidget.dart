import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/resturant/ResturantServicesController.dart';
import '../../../core/constant/appColor.dart';
import '../../../data/model/mealModel.dart';
import '../../../data/model/resturanDetails.dart';
import '../../../core/class/handlingData.dart';
class ResturantServicesWidget extends GetView<RestaurantServicesControllerImp> {
  const ResturantServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantServicesControllerImp>(
      builder: (controller) {
        return HandlingDataViewShimmer(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 60,
              width: double.infinity      ,
              color: Colors.grey[350]     ,
              child: ListView.builder(
                itemCount:controller.services.length ,
                scrollDirection: Axis.horizontal     ,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

                      controller.getMealsForCertainService(
                          ResturantDetails.fromJson(
                              controller.services[index]).servicesId.toString(),
                        index
                      );
                    },
                    child: Container(
                      decoration:BoxDecoration(
                          border:
                          Border(bottom: BorderSide(
                            width: 3,
                              color: controller.selectedID==index?
                              AppColor.primaryColor:Colors.transparent) )
                      ) ,
                      height: 60 ,
                      width: 100 ,
                      child: Center(
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,),
                          child: Text(
                            ResturantDetails.fromJson(
                                controller.services[index]).servicesName.toString(),
                            style: const TextStyle(
                                fontSize:14 ),
                          ),
                        ),
                      ),
                    ),
                  ) ;
                },),

            ));
      }
    );
  }
}
