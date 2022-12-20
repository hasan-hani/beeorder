import 'package:beeorder/controller/mealDetailsController.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../widget/homeScreenwidget/customBottomSheet.dart';
import '../widget/mealDetailsWidget/countNumberOfMeal.dart';
import '../widget/mealDetailsWidget/customTextFormFieldMealDetails.dart';
import '../widget/mealDetailsWidget/mealDescription.dart';
import '../widget/mealDetailsWidget/mealImage.dart';
import '../widget/mealDetailsWidget/rowPriceAndTitle.dart';
import '../widget/mealDetailsWidget/customBottomSheet.dart';
class MealDetailsScreen extends GetView<MealDetailsControllerImp> {
  static String id = '/MealDetailsScreen'     ;
  const MealDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MealDetailsControllerImp());
    return WillPopScope(
      onWillPop: () async{
        await controller.goToHomeScreen() ;
       return true  ;
      },
      child: SafeArea(
        child: Scaffold(
          bottomSheet:const CustomBottomSheetMealDetails()  ,
          body: ListView(
            children:const [
              SizedBox(height: 2,)                 ,
              MealImage()                          ,
              RowPriceAndTitle()                   ,
              MealDescription()                    ,
              Divider(thickness: 2)                ,
              CountNumberOfMeal()                  ,
              Divider(thickness: 2)                ,
              CustomTextFormFieldMealDetails()     ,
            ] ,
          ),
        ),
      ),
    );
  }
}
