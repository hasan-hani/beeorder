import 'package:beeorder/controller/profilecontoller/editProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';

class CustomDropDownButtonFieldGender extends GetView<EditProfileControllerImp> {
  const CustomDropDownButtonFieldGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          child : DropdownButtonFormField(
            decoration: InputDecoration(
              focusedBorder:OutlineInputBorder() ,
            ),
            value: controller.selectedGender  ,
              items: ['male'.tr,'female'.tr].map((gender) =>
                  DropdownMenuItem<String>(
                      value: gender ,
                      child: Text(gender))).toList(),
              onChanged: (gender) {
                controller.chooseGender(gender.toString())  ;
              },),
        );
      }
    );
  }
}
