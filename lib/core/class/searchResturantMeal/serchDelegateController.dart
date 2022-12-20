import 'package:beeorder/core/class/searchResturantMeal/searchDelegateData.dart';
import 'package:beeorder/core/function/handlingResponse.dart';
import 'package:get/get.dart';

import '../statusRequest.dart';

abstract class SearchDelegateController extends GetxController {
  getSearchedVal(String query)              ;
  searchMealRestaurant()                    ;
  chooseResMeal(int index)                  ;
}
class SearchDelegateControllerImp extends SearchDelegateController{
  int selectedResMeal  =0  ;
  late String searchedVal                                                 ;
  StatusRequest statusRequest = StatusRequest.none                        ;
  SearchDelegateData searchDelegateData=SearchDelegateData(Get.find())    ;
  List meals      = [] ;
  List restaurants= [] ;
  @override
  void onInit()async {

    super.onInit();
  }

  @override
  searchMealRestaurant()async{
    statusRequest =StatusRequest.loading     ;
    update() ;

    var response = await searchDelegateData.getCertineResturant(searchedVal) ;
    statusRequest = handling(response) ;
    print('======================$response==============') ;
    if(statusRequest==StatusRequest.success){
      meals       = (response['meal'] is List)? response['meal']:[] ;
      restaurants = (response['res']  is List)? response['res'] :[] ;
      //print('==================meals:$meals===========');
    }else{
      Future.delayed(const Duration(seconds: 8),()async {
        await searchMealRestaurant()  ;
      },) ;

    }
    update()   ;
  }

  @override
  getSearchedVal(String query) {
    searchedVal = query ;
  }

  @override
  chooseResMeal(int index) {
    selectedResMeal=index ;
    update()              ;
  }
}