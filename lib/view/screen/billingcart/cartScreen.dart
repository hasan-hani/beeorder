import 'package:beeorder/controller/billingCartController/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';
import '../../widget/cartWidget/costRow.dart';
import '../../widget/cartWidget/listOfOrderMeals.dart';
import '../homeScreen.dart';

class CartScreen extends StatelessWidget {
  static String id = '/CartScreen' ;
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp()) ;
    return WillPopScope(
      onWillPop: ()async{
        Get.offNamed(HomeScreen.id) ;
        return false ;
      } ,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin:const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'cart'.tr,
                    style:const TextStyle(
                        color: AppColor.secondaryColor,fontSize: 20), ),
                )                 ,
                const Divider()              ,
                const ListOfOrderMeals()     ,
                const Divider()              ,
                const CostRow()              ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
