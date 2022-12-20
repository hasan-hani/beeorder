import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/function/handlingResponse.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/model/mealModel.dart';
import 'package:beeorder/data/remote/mealDetailsData.dart';
import 'package:get/get.dart';

import '../core/constant/appData.dart';
import '../view/screen/billingcart/cartScreen.dart';
import '../view/screen/homeScreen.dart';

abstract class MealDetailsController extends GetxController {
  addFavoriteFun()       ;
  increaseOrderCountFun();
  decreaseOrderCountFun();
  addOrUpdateCart()      ;
  goToCart()             ;
  goToHomeScreen()       ;
}

class MealDetailsControllerImp extends MealDetailsController {
  StatusRequest statusRequest = StatusRequest.success           ;
  MealDetailsData mealDetailsData = MealDetailsData(Get.find()) ;
  late bool isLogin                    ;
  MyServices myServices = Get.find()   ;
  late String userId                   ;
  late MealModel mealModel             ;
  late int countOfOrder = 1            ; // number of meals     //
  late int ordersItemNumber = 0        ; // orders item number  //
  Map<String , Map<String,dynamic>> carts = {}          ; //have id , number of meals
  bool isFavorite = false              ;
  bool isOrdered  = false              ;
  bool canFav     = false              ;
  //==========================FUN==========================================//
  @override
  void onInit() {
    mealModel  = Get.arguments['MealModel']                ;
    canFav     = Get.arguments['canFav']                   ;
    isFavorite = mealModel.favorite == '1'                 ;
    userId = myServices.sharedPreferences.getString('id')! ;
    isLogin = !(userId =='-1')                             ;
    super.onInit()                                         ;
  }

  @override
  addFavoriteFun() async{
    statusRequest = StatusRequest.loading     ;
    update()                                  ;
    var response  = await mealDetailsData.addFavorite(userId, mealModel.mealId.toString());
    statusRequest = handling(response)        ;
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success') {
        mealModel.favorite = mealModel.favorite == '1' ? '0' : '1'   ;
        isFavorite = mealModel.favorite == '1'                       ;
        update()                                                     ;
      }
    }
    else{
      statusRequest = StatusRequest.success  ;
    }
    update() ;
  }

  @override
  increaseOrderCountFun() {
    countOfOrder =
        countOfOrder >= mealModel.mealNumber! ? countOfOrder : countOfOrder + 1;
    //countOfOrder++ ;
    update();
  }

  @override
  decreaseOrderCountFun() {
    countOfOrder = countOfOrder == 1 ? countOfOrder : countOfOrder - 1;
    update();
  }

  @override
  addOrUpdateCart() {
    if(!isLogin){
      return Get.defaultDialog(
        title: 'notice'.tr ,
        middleText: 'you cant buy without account'.tr
      ) ;
    }
    //============================todo correct the publicCarts to carts==================================
    publicCarts[mealModel.mealId.toString()] = {'count':countOfOrder,'mealModel':mealModel} ;
    update()  ;
  }

  @override
  goToCart() {
    Get.offNamed( CartScreen.id ) ;
  }

  @override
  goToHomeScreen() {
    Get.offNamed(HomeScreen.id) ;
  }
}
