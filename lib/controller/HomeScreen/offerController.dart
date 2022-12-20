import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/data/remote/home/offerData.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';

abstract class OfferController extends GetxController{}
class OfferControllerImp extends OfferController{
  StatusRequest statusRequest = StatusRequest.none ;
  List meals=[]                                     ;
  OfferData offerData = OfferData(Get.find())      ;
  @override
  void onInit() async{
    statusRequest = StatusRequest.loading          ;
    update()  ;
    await getOfferMeals()  ;
    super.onInit()   ;
  }
  getOfferMeals()async{

    var response = await offerData.getOfferedMeal();
    statusRequest = handling(response)             ;
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        meals=response['data']  ;
      }
    }else{
      Future.delayed(const Duration(seconds: 10,),()async {
        await getOfferMeals() ;
      },);
    }
    update() ;
  }
}