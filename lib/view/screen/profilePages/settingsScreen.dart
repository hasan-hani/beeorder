import 'package:beeorder/controller/profilecontoller/settingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';
import '../../widget/settingScreenWidget/contactTermwidget.dart';
import '../../widget/settingScreenWidget/saveButton.dart';
import '../../widget/settingScreenWidget/settingAndChooseLanguage.dart';

class MySettings extends GetView<SettingControllerImp> {
  static String id='/MySettings' ;
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp()) ;
    return SafeArea(
      child: Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingAndChooseLanguage()  ,
            GetBuilder<SettingControllerImp>(
              builder: (controller) {
                return Column(
                  children: [
                    CheckboxListTile(
                      value: !controller.isEnglish,
                        onChanged: (isSelected) {
                          controller.chooseLanguage(!isSelected!) ;
                        },
                      title: Text('arabic'.tr),
                    ),
                    const SizedBox(height: 5,) ,
                    CheckboxListTile(
                      value: controller.isEnglish,
                      onChanged: (isSelected) {
                        controller.chooseLanguage(isSelected!) ;
                      },
                      title:Text('english'.tr)   ,
                    ),
                  ],
                );
              }
            ),
            Container(
              height: 20,width: double.maxFinite,
              color: AppColor.greyColor,) ,
            const ContactTermWidget(),
            Container(
              height: 20,width: double.maxFinite,
              color: AppColor.greyColor,) ,
            const SizedBox(height: 3,),
            TextButton( onPressed: controller.logOut,
            child: Text('logout'.tr,
            style:const TextStyle(fontSize: 20,color: AppColor.primaryColor)),) ,
            const Spacer(),
            SaveButton(
                onSave:controller.onSave),
          ],
        ),
      ),
    );
  }
}
