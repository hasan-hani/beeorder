import 'package:flutter/material.dart'       ;
import 'package:get/get.dart'                ;
import '../../../controller/billingCartController/billingController.dart';
import '../../../core/constant/appColor.dart';
class FirstWidget extends GetView<BillingControllerImp> {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        const SizedBox(height: 10,),
        Center(child: Text('billing'.tr               ,
          style:const TextStyle(fontSize: 16),),)     ,
        const Divider(thickness: 1.5,)                ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('delvierCost'.tr,style:const TextStyle(fontSize: 16,color: AppColor.primaryColor),),
        )        ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('when'.tr),
        )        ,

        GetBuilder<BillingControllerImp>(
          builder: (controller) {
            return Column(
              children: [
                RadioListTile(
                  activeColor: AppColor.secondaryColor ,
                  title: Text('fast'.tr) ,
                  value: 'val1', groupValue: controller.radioSelectedVal,
                  onChanged: (val) {
                    controller.changeRadioSelectedVal(val.toString())  ;
                },)  ,
                RadioListTile(
                  activeColor: AppColor.secondaryColor ,
                  title: Text('chooseTime'.tr),
                  value: 'val2', groupValue: controller.radioSelectedVal,
                  onChanged: (val) {
                    controller.changeRadioSelectedVal(val.toString())  ;
                  },)  ,

              ],
            );
          }
        )  ,
        const Divider(thickness: 1.5,) ,

      ],
    );
  }
}
