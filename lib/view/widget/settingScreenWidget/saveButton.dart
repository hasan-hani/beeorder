import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onSave ;
  const SaveButton({Key? key, this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onSave     ,
      child: Container(
          height: 40            ,
          padding: EdgeInsets.all(8),
          width: double.maxFinite  ,
          decoration: BoxDecoration(
            color: AppColor.primaryColor            ,
            borderRadius: BorderRadius.circular(20) ,


          ),
          child:Center(
            child: Text('s'.tr,
              style:const TextStyle(color: Colors.white,fontSize: 20),),
          )
      ),
    );
  }
}
