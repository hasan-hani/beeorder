import 'package:get/get.dart';

import '../view/screen/auth/registerByPhoneScreen.dart'   ;

abstract class SplashScreenController extends GetxController{

}
class SplashScreenControllerImp extends  SplashScreenController{
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4),
            () {
          Get.offNamed(RegisterByPhoneScreen.id)  ;
        } );
    super.onInit();
  }


}