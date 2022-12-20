import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

snakbarMessageNoAccount(){
  return Get.snackbar(
    '16'.tr                                ,
    '17'.tr                                ,
    duration:const Duration( seconds : 3 ) ,
    snackPosition: SnackPosition.BOTTOM    ,
  ) ;
}