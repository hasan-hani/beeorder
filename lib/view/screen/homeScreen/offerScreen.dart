import 'package:beeorder/controller/HomeScreen/offerController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../core/class/handlingData.dart';
import '../../../core/constant/apiLink.dart';
import '../../../data/model/mealModel.dart';
import '../../widget/SearchResturant.dart';
import '../../widget/offerwidget/offerMeals.dart';
import '../mealDetailsScreen.dart';
import '../../../core/constant/appColor.dart';
class OfferScreen extends GetView<OfferControllerImp> {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OfferControllerImp());
    return Column(
      children:const [
        SizedBox(height: 10,)                     ,
        SearchRestaurunt()                       ,
        SizedBox(height: 10,)                     ,
        OfferMeals()                             ,
      ],
    );
  }
}