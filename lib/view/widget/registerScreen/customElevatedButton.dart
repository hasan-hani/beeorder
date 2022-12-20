import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authContoller/registerByPhoneController.dart';
import '../../../core/constant/appColor.dart';
class CustomElevatedButton extends GetView<RegisterByPhoneControllerImp> {
  const CustomElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterByPhoneControllerImp>(builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: controller.goToNextPage,
          child: Stack(
            children: [
              Positioned.fill(
                  child:Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft   ,
                            end  : Alignment.centerRight  ,
                            colors: [
                              AppColor.secondaryColor         ,
                              AppColor.primaryColor           ,
                            ])
                    ),
                  )
              ),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: Center(
                      child: Text(controller.buttonTitle,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)))
            ],
          ),
        ),
      ),
    ),);
  }
}
