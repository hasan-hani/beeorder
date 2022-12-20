
import 'package:beeorder/controller/homeController.dart';
import 'package:flutter/material.dart'                  ;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/HomeScreen/homeController.dart';
import '../../../core/class/searchResturantMeal/serchDelegate.dart';
import '../../widget/homeWidget/customFavoritMeal.dart';
import '../../widget/homeWidget/customNewerMeal.dart'   ;
import '../../widget/homeWidget/customPopularMeal.dart' ;
import '../../widget/SearchResturant.dart'   ;
import '../../widget/homeWidget/subTitle.dart'          ;

class Home extends GetView<HomeControllerImp> {
  const Home({Key? key}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        children: [
           const SearchRestaurunt()                         ,
           SubTitle( title: '6'.tr)                         ,
           const CustomPopularMeal()                        ,
           SubTitle( title: '7'.tr)                         ,
           const CustomNewerMeal()                          ,
           SubTitle( title: '15'.tr)                         ,
           const CustomFavoritMeal()                        ,
        ],
      ) ,
    );
  }
}