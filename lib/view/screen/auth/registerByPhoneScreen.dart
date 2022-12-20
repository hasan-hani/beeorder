import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/authContoller/registerByPhoneController.dart';
import '../../../core/constant/appview.dart';
import '../../widget/registerScreen/customElevatedButton.dart';
import '../../widget/registerScreen/customTextFormField.dart';
class RegisterByPhoneScreen extends StatelessWidget {
  static String id='/RegisterByPhoneScreen'        ;
  const RegisterByPhoneScreen({Key? key}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterByPhoneControllerImp()) ;
    return Scaffold(
      body:Container(
        margin:const EdgeInsets.symmetric(horizontal: 20,) ,
        decoration: AppView.backgroundImage  ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: const [
            CustomTextFormField()   ,
            CustomElevatedButton()  ,
          ],
        ),
      )
    );
  }
}
