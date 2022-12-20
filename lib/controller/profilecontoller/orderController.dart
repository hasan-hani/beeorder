import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/function/handlingResponse.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/ordersData.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController{
  getMyPreOrders()  ;
}
class OrderControllerImp extends OrderController{
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading ;
  MyServices myServices = Get.find()                  ;
  late String userId                                  ;
  List myPreOrders = []                               ;
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getString('id')!   ;
    getMyPreOrders() ;
    super.onInit();
  }

  @override
  getMyPreOrders() async{
    statusRequest = StatusRequest.loading  ;
    update()                               ;
    var response = await ordersData.getMyOrders(userId) ;
    statusRequest = handling(response)                  ;
    if(statusRequest==StatusRequest.success){
      myPreOrders = response['data']??[];
    }else{
      getMyPreOrders()  ;
    }
    update()   ;
  }

}
