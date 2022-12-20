import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constant/appColor.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() saveData ;
  const CustomElevatedButton({Key? key, required this.saveData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        saveData()   ;
      },
      child: Container(
        height : 40,
        width  : Get.width-20,
        decoration : BoxDecoration(
          gradient:const LinearGradient(
              colors: [AppColor.primaryColor ,AppColor.secondaryColor ]) ,
          color: AppColor.primaryColor ,
          borderRadius: BorderRadius.circular(20)
        ),
        child: const Center(
          child: Text('save',
            style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}
