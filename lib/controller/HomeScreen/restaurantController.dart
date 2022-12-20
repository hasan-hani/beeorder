import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/data/remote/home/restaurantData.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';
import '../../core/services/Services.dart';
import '../../data/model/resturantModel.dart';
import '../../view/screen/restaurantServicesScreen.dart';

abstract class RestaurantController extends GetxController {
  getAllRestaurant()      ;
  goToResturantDetailes(RestaurantModel restaurantModel,bool canFav) ;
}

class RestaurantControllerImp extends RestaurantController {
  StatusRequest  statusRequest  = StatusRequest.none         ;
  RestaurantData restaurantData = RestaurantData(Get.find()) ;
  late List listOfRestaurant = []                            ;
  MyServices myServices = Get.find()                         ;
  late String userId                                         ;
  @override
  void onInit() async{
    userId = myServices.sharedPreferences.getString('id')??'0'    ;
    await getAllRestaurant() ;
    super.onInit()     ;
  }

  @override
  getAllRestaurant() async {
    statusRequest = StatusRequest.loading ;
    update() ;
    var response = await restaurantData.getRestaurantData(userId);
    statusRequest = handling(response)                     ;
    if(statusRequest==StatusRequest.success){
      listOfRestaurant=response['data'] ;
      update()   ;
    }
    else{
      Future.delayed(const Duration(seconds: 10),
              ()async {
        await getAllRestaurant() ;
      });
    }

  }

  @override
  goToResturantDetailes(RestaurantModel restaurantModel,bool canFav) {

    Get.offNamed(ResturantServicesScreen.id,
        arguments: {
          'arg':restaurantModel ,
          'canFav':canFav       ,
        }
    )  ;
  }
}
