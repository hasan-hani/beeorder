import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controller/homeController.dart';
import '../widget/homeScreenwidget/customBottomSheet.dart';
import 'homeScreen/home.dart';

class HomeScreen extends GetView<HomeScreenControllerImp> {
  static String id='/HomeScreen'   ;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder : (controller) => SafeArea(
          child : Scaffold(
          bottomNavigationBar:const CustomBottomSheet() ,
          body:controller.pagesWidget[controller.selectedPageIndex]
    ) ,
        ),
    );
  }
}

