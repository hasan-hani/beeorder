import 'package:beeorder/core/class/crud.dart';
import 'package:get/get.dart';

import '../../../core/constant/apiLink.dart';

class ResturantServicesData{
  Crud crud ;
  ResturantServicesData(this.crud) ;
  getMealsForCetineResturant(String resturantID)async{
    var response = await crud.postData(ApiLink.certineResturant,
        {
          'resId': resturantID
    }
    );
    return response.fold((l) => l, (r) => r) ;

  }
  getMealsForCertainServices(String serviceID)async{
    var response=await crud.postData(
        ApiLink.getMealsForCertainService,
        {'serviceid':serviceID});
    return response.fold((l) => l, (r) => r) ;
  }
  addResturantToFav(String userId,String restuarntID)async{
    var response = await crud.postData(
        ApiLink.addRestaurantToFavorite ,
        {
          'userid'      : userId       ,
          'resturantid' : restuarntID
        }
    );
    return response.fold((l) => l, (r) => r)  ;
  }
}