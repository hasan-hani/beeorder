import 'package:beeorder/controller/billingCartController/cartController.dart';
import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';
import '../../../core/constant/appData.dart';
class CustomBottomSheetMealDetails extends GetView<MealDetailsControllerImp> {
  const CustomBottomSheetMealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put( MealDetailsControllerImp() ) ;
    return BottomAppBar(
        elevation: 0  ,
        child: Container(
          clipBehavior: Clip.hardEdge ,
          margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 24) ,
          decoration: BoxDecoration(
            color: AppColor.greyColor                       ,
            borderRadius: BorderRadius.circular(30)         ,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround  ,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                  child: IconButton(
                    onPressed:controller.addOrUpdateCart ,// add meal to carts
                      icon:const Icon(
                        Icons.shopping_basket_outlined,
                        color: AppColor.secondaryColor,))),
              GetBuilder<MealDetailsControllerImp>(
                builder: (controller) {
                  return Row(
                    children: [
                      //==========replace the publicCarts to controller.carts==========================
                      Text(publicCarts!={} ? 'showcart'.tr:'addcart'.tr  ,
                        style:const TextStyle(
                            color: AppColor.secondaryColor,fontSize: 20),),
                      const SizedBox(width:5)     ,
                      //==========replace the publicCarts to controller.carts==========================
                      publicCarts.isNotEmpty ? InkWell(
                        onTap:controller.goToCart ,
                        child: CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          //===========replace the publicCarts to controller.carts==================================
                          child:Text(publicCarts.length.toString())
                          ,),
                      ):const Text('')
                    ],
                  );
                }
              )
            ],
          ),
        )
    ) ;
  }
}
