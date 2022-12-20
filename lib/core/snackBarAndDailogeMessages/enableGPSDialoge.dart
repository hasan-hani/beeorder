import 'package:get/get.dart';

enableGPSDialoge(){
  return Get.defaultDialog(
    title     :  '16'.tr                       ,
    middleText:  '18'.tr                       ,
    onWillPop : () async {
      Get.back()   ;// to close dialog
      Get.back()   ;// to close page
      return false ;
    } ,
  )   ;
}