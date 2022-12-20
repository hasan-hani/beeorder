import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appColor.dart';

class MyAddressAddNewAddress extends StatelessWidget {
  final void Function() goToAddNewAddress                    ;
  const MyAddressAddNewAddress(
      {Key? key,required this.goToAddNewAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10)              ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Text('myaddress'.tr)                          ,
          const SizedBox(height: 4,)                    ,
          InkWell(
            onTap: goToAddNewAddress ,
            child: Row(
              children: [
              IconButton(onPressed: () {

              }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)) ,
              Text(
                'addnewaddress'.tr,
                style:const TextStyle(color: AppColor.primaryColor),),
            ],),
          ),
          const SizedBox(height: 10,)     ,
        ],
      ),
    );
  }
}
