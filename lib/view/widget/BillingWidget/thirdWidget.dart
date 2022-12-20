import 'package:flutter/material.dart'           ;
import 'package:get/get.dart'                    ;
import '../../../controller/billingCartController/billingController.dart';
import '../../../core/constant/appColor.dart'    ;
import '../../../core/constant/appData.dart'     ;
class ThirdWidget extends GetView<BillingControllerImp> {
  const ThirdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: controller.sendOrder  ,
      child: Container(
        height: 50                     ,
        color: AppColor.greyColor      ,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround  ,
          children: [
            const CircleAvatar(
              backgroundColor: AppColor.primaryColor  ,
                child: Icon(Icons.shopping_basket_rounded,color: Colors.white,))   ,
            Text('sendOrder'.tr)      ,
            CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              child: Text(
                toListPublicCarts().length.toString(),
                style: const TextStyle(color: Colors.white),)  ,
            )         ,
          ],
        )
      ),
    );
  }
}
