import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/authContoller/registerByPhoneController.dart';
import '../../../core/constant/appview.dart';

class CustomTextFormField extends GetView<RegisterByPhoneControllerImp> {
  const CustomTextFormField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterByPhoneControllerImp>(
      builder: (controller) => TextFormField(
        controller: controller.phoneController,
        onChanged: (value) {
          controller.changeTheTitle(value);
        },
        keyboardType: TextInputType.phone,
        maxLength: 10,
        decoration: InputDecoration(
          hintText: '9xx xxx xxx',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          focusedBorder:AppView.underlineInputBorder ,
          enabledBorder:AppView.underlineInputBorder,
          label: const Text('رقم موبايلي'),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

