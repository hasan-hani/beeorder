import 'package:beeorder/view/screen/profilePages/editProfile.dart' ;
import 'package:beeorder/view/screen/auth/registerInformationScreen.dart';
import 'package:flutter/material.dart'              ;
import 'package:get/get.dart'                       ;
import 'package:get/get_core/src/get_main.dart'     ;
import 'package:otp_text_field/otp_field.dart'      ;
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart'          ;
import '../../../controller/authContoller/otpController.dart';
import '../../../core/constant/appColor.dart'          ;
import '../../../core/class/handlingData.dart'         ;
import '../homeScreen.dart'                            ;

class OtpScreen extends StatelessWidget {
  static String id='/OtpScreen'  ;
  const OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OtpControllerImp()) ;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<OtpControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest ,
                widget: Center(
                  child:OTPTextField(
                    controller: controller.otpFieldController   ,
                    length: 5                ,
                    width : Get.width        ,
                    fieldWidth: Get.width/20 ,
                    otpFieldStyle:OtpFieldStyle(
                      borderColor       : AppColor.primaryColor ,
                      backgroundColor   : AppColor.primaryColor ,
                      enabledBorderColor: AppColor.primaryColor ,
                    ) ,
                    style:const TextStyle(
                        fontSize: 20            ,
                        color: Colors.white
                    )  ,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box   ,
                    onCompleted: (verCode) {
                      controller.goToRegisterInformationScreen(verCode)  ;
                    },
                  ),
                )
            ) ;
          }
        ),
      ) ,
    ) ;
  }
}
