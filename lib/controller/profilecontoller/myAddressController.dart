import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/profileData/myAdreesData.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';
import '../../view/screen/addressScreen/addNewAddressScreen.dart';
import '../../view/screen/profilePages/myAddessScreen.dart';

abstract class MyAddressController extends GetxController{
  getMYAddress()                           ;
  goToAddAddressScreen()                   ;
  deleteAddress(String addressID)          ;
}
class MyAddressControllerImp extends MyAddressController{
  StatusRequest statusRequest =  StatusRequest.loading     ;
  List addresses = []                                      ;
  MyAddressData myAddressData = MyAddressData(Get.find())  ;
  MyServices myServices = Get.find()                       ;
  @override
  void onInit()  {
    getMYAddress()    ;
    super.onInit()    ;
  }
  @override
  getMYAddress()async{
    statusRequest = StatusRequest.loading                                   ;
    update()                                                                ;
    String? userID = myServices.sharedPreferences.getString('id')           ;
    var response = await myAddressData.getAddress(userID.toString())        ;
    statusRequest = handling(response)                                      ;
    if(statusRequest==StatusRequest.success) {
      if(response['status']=='success'){
        addresses = response['data'];
      }else{
        addresses=[]                ;
      }
    }
    else {
      addresses =[]                               ;
    }
    update()                                      ;
    statusRequest  =  StatusRequest.success       ;
  }

  @override
  goToAddAddressScreen() {
    Get.offNamed(AddNewAddressScreen.id)    ;
  }

  @override
  deleteAddress(String addressID)async {
    statusRequest = StatusRequest.loading ;
    update()                              ;
    var response  = await myAddressData.deleteAddress(addressID) ;
    statusRequest = handling(response)    ;
    if(statusRequest==StatusRequest.success){
      getMYAddress()  ;
    }else{
    statusRequest = StatusRequest.success ;
    }
    update()  ;
  }
}