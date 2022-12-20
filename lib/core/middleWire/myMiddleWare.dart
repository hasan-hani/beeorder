

import 'package:beeorder/view/screen/auth/otpScreen.dart';
import 'package:beeorder/view/screen/auth/registerInformationScreen.dart';
import 'package:flutter/material.dart'           ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart'  ;
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../../view/screen/homeScreen.dart';
import '../services/Services.dart';

class MyMiddleWare extends GetMiddleware{

  @override
  int? priority = 0;
  MyServices myservices  =   Get.find()   ;
  @override
  RouteSettings? redirect(String? route) {
    String? step = myservices.sharedPreferences.getString('step') ;
    if(step=='3'){//  home screen step 3
      return RouteSettings( name:HomeScreen.id ) ;
    }
    if(step=='2'){//register information Screen step 2
      return RouteSettings( name:RegisterInformationScreen.id ) ;
    }
    if(step=='1'){ // OTP screen step 1
      return RouteSettings(name: OtpScreen.id)  ;
    }
  }

}