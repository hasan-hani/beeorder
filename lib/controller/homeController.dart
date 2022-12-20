import 'package:beeorder/core/services/Services.dart';
import 'package:get/get.dart'           ;
import 'package:flutter/material.dart'  ;

import '../view/screen/homeScreen/home.dart';
import '../view/screen/homeScreen/mainProfileScreen.dart';
import '../view/screen/homeScreen/resturantScreen.dart';
import '../view/screen/homeScreen/offerScreen.dart';
abstract class HomeController extends GetxController{
  selectPageFun(int page) ;
}
class HomeScreenControllerImp extends HomeController{
  MyServices myServices = Get.find()            ;
  List<IconData> iconsBottomSheet= [ Icons.home,Icons.restaurant,Icons.local_offer_outlined,Icons.person] ;
  List<String> pageList = ['2'.tr,'3'.tr,'4'.tr,'5'.tr]          ;
  int selectedPageIndex = 0                 ;
  List<Widget> pagesWidget=const [
    Home()                      ,
    RestaurantScreen()          ,
    OfferScreen()               ,
    MainProfileScreen()         ,
  ];
  @override
  void onInit() {
    selectedPageIndex= myServices.sharedPreferences.getInt('selectedPage') ?? selectedPageIndex ;   //shared preference key
    super.onInit()  ;
  }

  @override
  selectPageFun(int page) {
    selectedPageIndex = page      ;
    myServices.sharedPreferences.setInt('selectedPage', page) ;
    update()                                                  ;
  }
}