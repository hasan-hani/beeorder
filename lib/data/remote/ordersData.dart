import 'package:beeorder/core/class/crud.dart';

import '../../core/constant/apiLink.dart';

class OrdersData{
  Crud crud              ;
  OrdersData(this.crud)  ;
  getMyOrders(String userId)async{
    var response =await crud.postData(ApiLink.getMyOrder, {'userid':userId});
    return response.fold((l) => l,(r) => r) ;
  }
}