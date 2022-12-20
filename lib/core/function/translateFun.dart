import 'package:get/get.dart';

import '../services/Services.dart';

String translate({required String ar ,required String en}){
  MyServices myServices =Get.find()    ;
  return myServices.sharedPreferences.getString('lang')=='en' ? en:ar ;
}