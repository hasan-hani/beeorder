import 'package:beeorder/controller/HomeScreen/mainProfileController.dart' ;
import 'package:flutter/material.dart'                          ;
import 'package:get/get.dart'                                   ;
import '../../widget/mainProfileWidget/appBarImageProfile.dart' ;
import '../../widget/mainProfileWidget/customProfileItem.dart'  ;
class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key)         ;
  @override
  Widget build(BuildContext context) {
    MainProfileControllerImp controller = Get.put(MainProfileControllerImp()) ;
    return ListView(
      children:  [
        const AppBarImageProfile()                            ,
        const SizedBox(height: 6,)                            ,
        ...List.generate(5, (index) =>
            CustomProfileItem(
              title   : controller.listOfMainTitle[index]     ,
              subTitle: controller.listOfSubTitle[index]      ,
              onTap   : controller.listOfFun[index]           ,
            )                                                 ,
        )
      ],
    );
  }
}
