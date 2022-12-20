import 'package:beeorder/controller/profilecontoller/editProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingData.dart' ;
import '../../../core/constant/appImage.dart'  ;
import '../../../core/constant/appview.dart'   ;
import '../../../core/constant/textStyle.dart' ;
import '../../../core/function/validinput.dart';
import '../../widget/registerAfterApprove/customDropDownButtonCity.dart';
import '../../widget/registerAfterApprove/customElevatedButton.dart';
import '../../widget/registerAfterApprove/customeTextFieldRegisterAfterApprove.dart';
import '../../widget/registerAfterApprove/cutomDropDownButtonFieldGender.dart';

class EditProfileScreen extends GetView<EditProfileControllerImp> {
  static String id='/EditProfileScreen';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileControllerImp()) ;
    return Scaffold(
      body: GetBuilder<EditProfileControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(statusRequest: controller.statusRequestSave,
            widget: Center(
              child: Form(
                key: controller.formState ,
                child: ListView(
                    children: [
                      const SizedBox(height: 100,) ,
                      ...List.generate(5,
                              (index) {
                            int i = index > 2 ? index-1 : index ;
                            return index==3? const CustomDropDownButtonFieldGender():
                            CustomTextFieldRegisterAfterApprove(
                                isActive:index != 1    , //to ensure not to change value of number
                                controllerVal: controller.listOfController[i]  ,
                                onTap: i==3? (){controller.getDatePicker(context);}:null ,//dateTextForm
                                needValidator: i==2 ? false:true  ,

                            ) ;
                          })  ,
                      const CustomDropDownButtonCity()  ,
                      const SizedBox(height: 20,)              ,
                      CustomElevatedButton(saveData: controller.saveRegisterData)             ,
                    ]
                ),
              ),
            ) ,

          );
        }
      )
    );
  }
}
