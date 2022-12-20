import 'package:flutter/material.dart'                  ;
import 'package:get/get.dart'                           ;
import '../../../controller/billingCartController/billingController.dart';
import '../../../core/class/handlingData.dart'          ;
import '../../widget/BillingWidget/firstWidget.dart'    ;
import '../../widget/BillingWidget/noAddressWidget.dart';
import '../../widget/BillingWidget/secondWidget.dart'   ;
import '../../widget/BillingWidget/thirdWidget.dart'    ;
class BillingScreen extends GetView<BillingControllerImp> {
  static String id = '/BillingScreen'  ;
  const BillingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BillingControllerImp());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<BillingControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequestSendOrder ,
                widget: HandlingDataViewShimmer(
                  widget: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: const[
                            FirstWidget()   ,
                            SecondWidget()  ,
                          ],),
                      )  ,
                      const ThirdWidget()  ,
                    ],
                  ),
                  statusRequest: controller.statusRequestAddress,
                  noDataWidget:const NoAddressWidget(),

                )
            );
          }
        ) ,
      ),
    );
  }
}
