import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appview.dart';

class SettingAndChooseLanguage extends StatelessWidget {
  const SettingAndChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('setting'.tr,style:AppView.subTitle),
          const SizedBox(height: 3,),
          const Divider()         ,
          const SizedBox(height: 3,),
          Text('choose'.tr,style:AppView.subTitle) ,
        ],
      )
    );
  }
}
