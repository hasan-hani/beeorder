import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/profilecontoller/editProfileController.dart';
class CustomDropDownButtonCity extends GetView<EditProfileControllerImp> {
  const CustomDropDownButtonCity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric( horizontal: 16 , vertical: 8) ,
          child: DropdownButtonFormField(
              decoration:const InputDecoration(focusedBorder:OutlineInputBorder() ,) ,
              value: controller.selectedCity             ,
              items: controller.listOfCities.map((item)
              =>DropdownMenuItem<String>(value: item,child: Text(item),) ).toList(),
            onChanged : (city) {
                controller.chooseCity(city.toString())   ;
            } ,

              ),
        );
      }
    );
  }
}
