import 'package:beeorder/core/class/crud.dart';

import '../../../core/constant/apiLink.dart';

class RestaurantData{
  Crud crud ;
  RestaurantData(this.crud) ;
  getRestaurantData(String userId)async{
    var response=await crud.postData(ApiLink.restaurant, {'id':userId});
    return response.fold((l) => l, (r) => r) ;
  }
}