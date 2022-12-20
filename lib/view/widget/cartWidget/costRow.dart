import 'package:beeorder/controller/billingCartController/cartController.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';
import '../../../core/constant/appData.dart';
class CostRow extends GetView<CartControllerImp> {
  const CostRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('cost'.tr)  ,
            GetBuilder<CartControllerImp>(
              builder: (controller) {
                return Text(controller.calcTotalPrice().toString());
              }
            )   ,

          ],),
        Container(
          color: AppColor.greyColor    ,
          height: 50                   ,
          width: double.maxFinite      ,
          child: InkWell(
            onTap: controller.goToBillingScreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                const CircleAvatar(

                  child: Icon(
                    Icons.shopping_basket_rounded ,color: Colors.white, )      ,
                  backgroundColor: AppColor.primaryColor,
                ) ,
                Text('continue'.tr ,
                  style: TextStyle(color: AppColor.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),) ,
                GetBuilder<CartControllerImp>(
                  builder: (controller) {
                    return CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: Text(toListPublicCarts().length.toString(),
                        style:const TextStyle(color: Colors.white),),);
                  }
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
