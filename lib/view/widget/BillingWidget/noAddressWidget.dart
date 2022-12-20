import 'package:flutter/material.dart'       ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screen/homeScreen.dart';
import '../publicwidget/publicButton.dart';
class NoAddressWidget extends StatelessWidget {
  const NoAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment  : MainAxisAlignment.center  ,
        crossAxisAlignment : CrossAxisAlignment.center ,
        children: [
          const Text('please input address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
          const SizedBox(height: 20,)     ,
          PublicButton(title: 'OK',onTap: () {
            Get.offAllNamed( HomeScreen.id )  ;
          },),
        ],
      ),
    );
  }
}
