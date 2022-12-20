import 'package:beeorder/controller/billingCartController/cartController.dart';
import 'package:beeorder/data/model/mealModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/appData.dart';
import '../../../core/function/translateFun.dart';
import '../../../data/model/cartModel.dart';
import '../publicwidget/cartItem.dart';

class ListOfOrderMeals extends GetView<CartControllerImp> {
  const ListOfOrderMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Expanded(
        child: ListView.separated(
          itemCount: toListPublicCarts().length + 1,
          itemBuilder: (context, index) {
            return index == toListPublicCarts().length
                ?  InkWell(
              onTap: controller.goToHomePage,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.center ,
                      children:  [
                        Text('addDishe'.tr)          ,
                        const Icon(Icons.add)        ,
                      ],
                    ),
                  ),

                )
                : CartItem(
                    count:
                        CartModel.fromJson(toListPublicCarts()[index]).count!,
                    mealModel: CartModel.fromJson(toListPublicCarts()[index])
                        .mealModel!,
                    delete: () {
                      controller.deleteOneMealFromCarts(
                          CartModel.fromJson(toListPublicCarts()[index])
                              .mealModel!
                              .mealId
                              .toString());
                    },
                    increase: () {
                      controller.increaseNumberOfMeals(
                          CartModel.fromJson(toListPublicCarts()[index])
                              .mealModel!
                              .mealId
                              .toString());
                    },
                    decrease: () {
                      controller.decreaseNumberOfMeals(
                          CartModel.fromJson(toListPublicCarts()[index])
                              .mealModel!
                              .mealId
                              .toString());
                    },
                  )  ;
          }, separatorBuilder: (BuildContext context, int index) {
            return const Divider(thickness: 2,); },
        ),
      ) ;
    });
  }
}


