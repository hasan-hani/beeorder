import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/registerData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/class/snakBarMessage.dart';
import '../../core/function/handlingResponse.dart';
import '../../view/screen/homeScreen.dart';
import '../../view/screen/auth/otpScreen.dart';

abstract class RegisterByPhoneController extends GetxController{
  changeTheTitle(String? value) ;
  goToNextPage()    ;
}
class RegisterByPhoneControllerImp extends RegisterByPhoneController{
  StatusRequest statusRequest  =  StatusRequest.none             ;
  MyServices    myServices     =  Get.find()                     ;
  RegisterData  registerData   = RegisterData(Get.find())        ;
  late   TextEditingController   phoneController                 ;
  bool     isReadyToSend  =  false                               ;
  String buttonTitle ='تخطى' ;
  //=========================Method=======================
  @override
  void onInit() {
    phoneController = TextEditingController()  ;
    super.onInit()       ;
  }

  @override
  changeTheTitle(String? value) {
    buttonTitle   = value!=''||value==null  ? 'ارسل':'تخطى' ;
    isReadyToSend = value!=''||value==null  ?  true:false   ;
    update()    ;
  }

  @override
  goToNextPage()async {
    if(!isReadyToSend){
      //  key no register id and phone
      myServices.sharedPreferences.setString('phone', '0000000000') ;
      myServices.sharedPreferences.setString('id' , '-1')           ;
      //  key no register id and phone
      Get.offNamed(HomeScreen.id)                                   ;
      return null                                                   ;
    }
    if(!phoneController.text.isPhoneNumber){
       Get.snackbar('', 'invalid phone number'
           ,snackPosition:SnackPosition.BOTTOM,
           messageText: const Text('invalid phone number',style:TextStyle(fontSize: 18) ,) )   ;
       return null                          ;
    }
    if(isReadyToSend){
      statusRequest=StatusRequest.loading   ;
      loadingSnackBar                       ;
       var response  = await registerData.postData(phoneController.text)  ;
       await Get.closeCurrentSnackbar()     ;
       statusRequest = handling(response)   ;
       if(statusRequest==StatusRequest.success){
         if(response['status']=='success'){
           // to return this step if you close app
           myServices.sharedPreferences.setString('step','1')  ;
           // key id and phone
           myServices.sharedPreferences.setString('phone', response['data']['users_phone']) ;
           myServices.sharedPreferences.setString('id' , response['data']['users_id'].toString());
           Get.offNamed(OtpScreen.id)      ;
         }

       }else{
         Get.snackbar('title', 'error during register',) ;
       }
    }
  }
  @override
  void dispose() {
    phoneController.dispose() ;
    super.dispose();
  }
}