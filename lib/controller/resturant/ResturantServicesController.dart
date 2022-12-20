import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/model/resturantModel.dart';
import 'package:beeorder/data/remote/resturant/resturantServicesData.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';
import '../../view/screen/addressScreen/resturantAddressScreen.dart';
import '../../view/screen/homeScreen.dart';

abstract class ResturantServicesController extends GetxController{
  getCertianResturantServices()   ;
  goToRestaurantMap()             ;
  addMyFavorite()                 ;
  getMealsForCertainService(String serviceID,int index)     ;
  goToHomeScreen()                ;
}
class RestaurantServicesControllerImp extends ResturantServicesController{
  late RestaurantModel restaurantModel ;
  late String userId                   ;
  bool canFav = false                  ;
  MyServices myServices = Get.find()   ;
  ResturantServicesData resturantServicesData = ResturantServicesData(Get.find()) ;
  StatusRequest statusRequest = StatusRequest.none           ;
  StatusRequest addFavStatusRequest = StatusRequest.success  ;
  List meals       = []       ;
  List services    = []       ;
  int  selectedID  = -1       ;
  bool isFavorite  = false    ;
  @override
  void onInit()async {
    restaurantModel =  Get.arguments['arg']      ;
    canFav = Get.arguments['canFav']??canFav     ;
    isFavorite = restaurantModel.favorite=='1'   ;
    userId = myServices.sharedPreferences.getString('id')! ;
    await getCertianResturantServices()          ;
    super.onInit()                               ;
  }

  @override
  getCertianResturantServices()async {
    statusRequest =StatusRequest.loading ;
    update()   ;
    var response  = await resturantServicesData.getMealsForCetineResturant(
        restaurantModel.restaurantId.toString());
    statusRequest = handling(response)  ;
    if(statusRequest==StatusRequest.success){
      meals    = (response['meal'] is List)? response['meal']:[]     ;
      services = (response['services'] is List)? response['services']:[]     ;
      print('=======================meals:$meals==============');

    }else{
      Future.delayed(const Duration(seconds: 4 ,),
              ()async{
        await getCertianResturantServices();
      });
    }
    update() ;

  }

  @override
  addMyFavorite() async{
    addFavStatusRequest = StatusRequest.loading ;
    update()                                    ;
    var response = await resturantServicesData.addResturantToFav
      ( userId  , restaurantModel.restaurantId.toString() ) ;
    addFavStatusRequest = handling(response) ;
    if(addFavStatusRequest==StatusRequest.success){
      if(response['status']=='success'){
        isFavorite = !isFavorite   ;

      }
    }
    addFavStatusRequest = StatusRequest.success  ;
    update()     ;
  }

  @override
  goToRestaurantMap() {
    Get.toNamed(
        ResturantAddressScreen.id ,
        arguments: {'restaurantModel':restaurantModel})  ;
  }

  @override
  getMealsForCertainService(String serviceID,int index) async{
    statusRequest = StatusRequest.loading ;
    update() ;
    //====================================================================
    //====================================================================
    var response = await resturantServicesData.getMealsForCertainServices(serviceID);
    //=====================================================================
    //=====================================================================
    statusRequest = handling(response) ;
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        selectedID  = index    ;
        meals  = (response['data'] is List) ? response['data']:[] ;
        update()   ;
      }
    }else{
      await getMealsForCertainService(serviceID,index) ;
    }
  }

  @override
  goToHomeScreen() {
    Get.offAllNamed(HomeScreen.id)  ;
  }
}