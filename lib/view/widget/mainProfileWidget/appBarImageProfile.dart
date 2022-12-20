import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/flutter_svg.dart'  ;
import '../../../controller/HomeScreen/mainProfileController.dart';
import '../../../core/constant/appImage.dart';
import '../../../core/constant/textStyle.dart';
class AppBarImageProfile extends GetView<MainProfileControllerImp> {
  const AppBarImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250 ,
      child:Stack(
        children: [
          SizedBox(
            height: 125 ,
            child: Image.asset(AppImage.appBarProfileImage,fit: BoxFit.fill,),
          )      ,
          Positioned(
              bottom: 60     ,
              top   : 60     ,
              left  : 100    ,
              right : 100    ,
              child: Container(
                decoration: const BoxDecoration(

                  color: Colors.white ,
                  shape: BoxShape.circle ,
                ),
                child: GetBuilder<MainProfileControllerImp>(
                  builder: (controller) {
                    return InkWell(
                      onTap: controller.chooseImageProfile ,
                      child: SvgPicture.asset(
                        controller.selectedProfileImage ,
                        fit: BoxFit.contain ,height: 50,width: 50, ) ,
                    )  ;
                  }
                ),
              )
          )    ,
          Positioned(
            bottom: 2,
              left: Get.width/2-22 ,
              child: Center(child: Text('name',style: AppStyle.mealTextStyle,)))    ,
        ] ,
      )   ,
    )     ;
  }
}
