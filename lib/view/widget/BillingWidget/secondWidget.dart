
import 'package:flutter/material.dart'                      ;
import 'package:get/get.dart'                               ;
import '../../../controller/billingCartController/billingController.dart';
import '../publicwidget/buplicTextFormField.dart'           ;
import '../publicwidget/publicDropDownButtonFormField.dart' ;

class SecondWidget extends GetView<BillingControllerImp> {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('title'.tr)        ,

          ),
          PublicDropDownButtonFormField(
            items: controller.addressTitles           ,
            selectedValue: controller.selectedAddress ,
            onChanged: (String? newVal ) {
              controller.selectedNewAddress(newVal) ;
            } ,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12)    ,
            child: Text('notices'.tr)                            ,
          )     ,
          PublicTextFormField(con: controller.noticeOneCon,hint: 'addnotice'.tr,)     ,
          const SizedBox(height: 6,)                                                  ,
          PublicTextFormField(con: controller.noticeTowCon,hint: 'newnotice'.tr,)     ,
          const SizedBox(height: 20,)  ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: [
              Text('cost'.tr)        ,
              Text(controller.totalCost.toString()+'sp'.tr )
            ],
          )                     ,
        ],

      ),
    );
  }
}
