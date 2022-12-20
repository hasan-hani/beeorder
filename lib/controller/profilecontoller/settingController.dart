import 'package:beeorder/core/constant/appData.dart';
import 'package:beeorder/core/localization/myTranslationController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/services/Services.dart';
import '../../view/screen/auth/registerByPhoneScreen.dart';
import '../../view/screen/splashScreen.dart';

abstract class SettingController extends GetxController{
  chooseLanguage(bool isSelected)  ;
  onSave()   ;
  logOut()   ;
}
class SettingControllerImp extends SettingController{
  MyServices myServices =  Get.find() ;
  late bool isEnglish                 ;

  late MyTranslationController   myTranslationController     ;
  @override
  void onInit()async {
    isEnglish =  myServices.sharedPreferences.getString('lang')=='en' ;
    myTranslationController =Get.put(MyTranslationController())       ;
    super.onInit();
  }

  @override
  chooseLanguage(bool isSelected) {
    isEnglish = isSelected  ;
    update()                ;
  }
  @override
  onSave() {
    isEnglish ?
    myTranslationController.changeLanguage('en'):
    myTranslationController.changeLanguage('ar');
    Get.back() ;
  }

  @override
  logOut() {
    myServices.sharedPreferences.setString('step', '-1');
    publicCarts= {}                           ;
    Get.offAllNamed(RegisterByPhoneScreen.id) ;
  }

}
