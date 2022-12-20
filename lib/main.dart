import 'package:beeorder/core/localization/myTranslationController.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/view/screen/homeScreen.dart';
import 'package:beeorder/view/screen/profilePages/editProfile.dart';
import 'package:beeorder/view/screen/auth/registerByPhoneScreen.dart';
import 'package:beeorder/view/screen/splashScreen.dart'            ;
import 'package:flutter/material.dart'                             ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart' ;

import 'core/class/shimmerLoading.dart'      ;
import 'core/constant/myRoutes.dart'         ;
import 'core/binding/myBinding.dart'         ;
import 'core/localization/myTranslation.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized()  ;
  await initialServices()                    ;
  runApp(const MyApp())                      ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyTranslationController controller = Get.put(MyTranslationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false    ,
      initialBinding: MyBinding()          ,
      translations  : MyTranslation()      ,
      locale: controller.language          ,
      title: 'Flutter Demo'                ,
      theme: ThemeData(
        primarySwatch : Colors.blue        ,
      )                                    ,
      getPages: myRoutes                   ,
      home:const SplashScreen()            ,
    );
  }
}


