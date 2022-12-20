import 'package:flutter/material.dart'    ;
import 'package:get/get.dart';

import '../../../controller/AddressController/addNewAddressController.dart';
import '../publicwidget/publicButton.dart';
import 'cutomTextFormFieldAddAddress.dart';
class CustomDraggableSheet extends StatelessWidget {
  const CustomDraggableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddNewAddressControllerImp controller = Get.put(AddNewAddressControllerImp());
    return DraggableScrollableSheet(builder: (context, scrollController) {
      return Container(
        padding: const EdgeInsets.only(
          top   : 40 ,
          bottom: 5  ,
          left  : 16 ,
          right : 16 ,
        ),
        decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft  : Radius.circular(50) ,
              topRight : Radius.circular(50) ,
            )
        ),

        child: Form(
          key: controller.globalKey ,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController ,
                  itemCount: 6                ,
                  itemBuilder: (context, index) {
                    return CustomTextFormFieldAddAddress(
                      hint:       controller.hints[index]                  ,
                      controller: controller.keyboardControllers[index]    ,
                    ) ;
                  },),
              )            ,
              PublicButton(title: 's'.tr,onTap:controller.saveNewAddress ),
              // ElevatedButton(onPressed: () {
              //   controller.saveNewAddress() ;
              // }, child: Text('s'.tr),)
            ],
          ),
        ),
      );


    },);
  }
}
