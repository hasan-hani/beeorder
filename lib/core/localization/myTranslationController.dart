import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/view/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/homeScreen.dart';

class MyTranslationController extends GetxController{
  //===========================var===========================//
  late Locale language =const Locale('ar')    ;
  MyServices myServices =Get.find()           ;

  //==========================methods==========================//
  @override
  onInit()  {
    String?      sharedPrefLang  =  myServices.sharedPreferences.getString('lang') ;
    language  =  sharedPrefLang == 'en' ? const Locale('en'):const Locale('ar');
    super.onInit() ;
  }

  changeLanguage(String languageCode){
    Locale locale = Locale(languageCode)                         ;
    myServices.sharedPreferences.setString('lang', languageCode) ;
    Get.updateLocale(locale)                                     ;
    Get.offAllNamed(HomeScreen.id)                               ;
  }

}