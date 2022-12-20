import 'package:beeorder/core/class/crud.dart';
import '../../core/constant/apiLink.dart';
class BillingData{
  Crud crud ;
  BillingData(this.crud)  ;
  getUserAddresses(String userId)async{
    var response = await crud.postData(ApiLink.address  , {'id':userId});
    return response.fold((l) => l, (r) => r) ;
  }
  sendOrder(String userId ,String mealId ,String orderCount,String addressId)async{
    var response = await crud.postData(
      ApiLink.sendOrder ,
      {
        'userid' : userId                    ,
        'mealid' : mealId                    ,
        'ordercount': orderCount                ,
        'addressid'      :addressId                  ,
      }
    ) ;
    return response.fold((l) => l, (r) => r)   ;
  }
}