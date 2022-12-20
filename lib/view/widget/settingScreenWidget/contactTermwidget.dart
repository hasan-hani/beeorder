import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appview.dart';

class ContactTermWidget extends StatelessWidget {
  const ContactTermWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3,),
          Text('contact'.tr,style: AppView.subTitle,) ,
          const SizedBox(height: 3,),
          Text('about'.tr,style: AppView.subTitle,) ,
          const SizedBox(height: 3,),
          Text('privicy'.tr,style: AppView.subTitle,) ,
          const SizedBox(height: 3,),
          Text('therm'.tr,style: AppView.subTitle,) ,
        ],
      ),
    );
  }
}
