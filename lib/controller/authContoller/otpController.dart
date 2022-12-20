import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/otpData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../core/function/handlingResponse.dart';
import '../../view/screen/auth/registerInformationScreen.dart';

abstract class OtpController extends GetxController {
  goToRegisterInformationScreen(String verCode)           ;
}
class OtpControllerImp extends OtpController{
  StatusRequest statusRequest = StatusRequest.success     ;
  late String userId                                      ;
  MyServices myServices = Get.find()                      ;
  OtpData otpData  = OtpData(Get.find())                  ;
  late OtpFieldController otpFieldController              ;
  @override
  goToRegisterInformationScreen(String verCode)async {
    statusRequest = StatusRequest.loading                   ;
    update()                                                ;
    var response = await otpData.checkCode(userId, verCode) ;
    statusRequest = handling(response)                      ;
    if(statusRequest==StatusRequest.success){
      // to return this step if you close app
      if(response['status']=='success'){
        myServices.sharedPreferences.setString('step','2')  ;
        Get.offNamed(RegisterInformationScreen.id)          ;
      }
    }

    statusRequest = StatusRequest.success   ;
    update()                                ;

  }
  @override
  void onInit() {
    otpFieldController = OtpFieldController()               ;
    userId = myServices.sharedPreferences.getString('id')!  ;
    super.onInit()                                          ;
  }

}