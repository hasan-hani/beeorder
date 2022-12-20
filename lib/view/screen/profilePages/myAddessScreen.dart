import 'package:beeorder/controller/profilecontoller/myAddressController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/myAddressWidget/myAddressAddnewAddress.dart';
import '../../widget/myAddressWidget/myAddressWidget.dart';

class MyAddressScreen extends StatelessWidget {
  static String id='/MyAddress' ;
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressControllerImp controller = Get.put(MyAddressControllerImp());
    return SafeArea(
      child: Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAddressAddNewAddress(
                goToAddNewAddress : controller.goToAddAddressScreen
            )                                ,
            const MyAddressWidget()          ,
          ],
        ),
      ),
    );
  }
}
