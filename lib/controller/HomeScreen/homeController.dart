import 'package:beeorder/controller/homeController.dart';
import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/home/homeData.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';

abstract class HomeController extends GetxController{
  getData();
  onTapSearch() ;
}
class HomeControllerImp extends HomeController{
  late String myId                                        ;
  StatusRequest statusRequest = StatusRequest.loading     ;
  HomeData homeData     = HomeData(Get.find())            ;
  List     listOfMeal   = []                              ;
  MyServices myServices = Get.find()                      ;
  @override
  void onInit()async {
    myId =myServices.sharedPreferences.getString('id') !  ;
    await getData()  ;
    super.onInit()   ;
  }
  @override
  getData()async{
    var response=await homeData.getData(myId) ;
    statusRequest = handling(response)      ;
    if(statusRequest==StatusRequest.success){
      listOfMeal = []                       ;
      listOfMeal = response["data"]         ;
      update()                              ;
    }else{
      Future.delayed(const Duration(seconds: 10),()async {
        await getData() ;
      },) ;
    }
    update()  ;
  }

  @override
  onTapSearch() {

  }
}