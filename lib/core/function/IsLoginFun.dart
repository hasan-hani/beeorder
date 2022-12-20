import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/Services.dart';

bool isLoginFun(){
  MyServices myServices = Get.find()  ;
  return myServices.sharedPreferences.getString('id')!='-1' ? true:false ;
}