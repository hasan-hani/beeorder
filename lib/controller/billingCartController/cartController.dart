import 'package:beeorder/core/constant/appData.dart';
import 'package:beeorder/data/model/mealModel.dart';
import 'package:get/get.dart';

import '../../view/screen/billingcart/billingScreen.dart';
import '../../view/screen/homeScreen.dart';

abstract class CartController extends GetxController{
  updateCarts(String mealId , int mealCount)  ;
  deleteOneMealFromCarts(String mealID)       ;
  increaseNumberOfMeals(String mealID)        ;
  decreaseNumberOfMeals(String mealID)        ;
  calcTotalPrice()                            ;
  goToHomePage()                              ;
  goToBillingScreen()                         ;
}
class CartControllerImp extends CartController{
  Map <String,int> carts = {} ;

  @override
  updateCarts(String mealId, int mealCount) {
    carts[mealId] = mealCount   ;
    update()                    ;
  }

  @override
  deleteOneMealFromCarts(String mealID) {
    //replace publicCarts with carts
    publicCarts.remove(mealID) ;
    update()          ;
  }

  @override
  increaseNumberOfMeals(String mealID) {
    publicCarts[mealID]!['count']=publicCarts[mealID]!['count']+1 ;
    update()                      ;
  }

  @override
  decreaseNumberOfMeals(String mealID) {

    publicCarts[mealID]!['count']=publicCarts[mealID]!['count']==1?1:publicCarts[mealID]!['count']-1 ;
    update()                      ;
  }

  @override
  int calcTotalPrice() {
    int totlePrice = 0 ;
    for(int i= 0 ; i<publicCarts.length ;i++){
      totlePrice = totlePrice +
          (toListPublicCarts()[i]['count'] as int)*
          ( toListPublicCarts()[i]['mealModel']as MealModel).mealPrice!  ;
    }
    return totlePrice ;

  }

  @override
  goToHomePage() {
    Get.offNamed(HomeScreen.id)  ;
  }

  @override
  goToBillingScreen() {
    Get.toNamed(BillingScreen.id,arguments: {'totalPrice':calcTotalPrice()})  ;
  }




}