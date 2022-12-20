import 'dart:io';

import 'package:beeorder/core/class/statusRequest.dart'   ;
import 'package:beeorder/core/services/Services.dart'     ;
import 'package:flutter/widgets.dart'                     ;
import 'package:get/get.dart'                             ;
import '../../../data/remote/billingData.dart'            ;
import '../../core/constant/appData.dart'                 ;
import '../../core/function/handlingResponse.dart'        ;
import '../../data/model/address.dart'                    ;
import '../../data/model/cartModel.dart'                  ;
import '../../data/remote/billingData.dart'               ;
import '../../view/screen/homeScreen.dart'                ;

abstract class BillingController extends GetxController{
  changeRadioSelectedVal(String val)  ;
  getAddresses()                      ;
  selectedNewAddress(String? newVal)  ;
  sendOrder()  ;
  deleteAMealFromCart(String mealId)               ;
}
class BillingControllerImp extends BillingController{
  StatusRequest statusRequestSendOrder = StatusRequest.success  ;
  MyServices myServices = Get.find()                            ;
  BillingData billingData = BillingData(Get.find())             ;
  late String userId                                            ;
  late List address                                             ;
  late String selectedAddressId                                 ;
  //===========================first widget========================\
  String radioSelectedVal = 'val1'   ;  //    fastest
  //===========================first widget========================
  //===========================second widget=======================
  late List<String> addressTitles    = []                 ;
  late String selectedAddress        =  ''                ;
  StatusRequest statusRequestAddress = StatusRequest.none ;
  late TextEditingController noticeOneCon                 ;
  late TextEditingController noticeTowCon                 ;
  int totalCost  =   0                                    ;
  //===========================second widget=======================
  @override
  void onInit()async{
    userId       =  myServices.sharedPreferences.getString('id')!  ;
    totalCost    =  Get.arguments['totalPrice']  ;
    noticeOneCon =  TextEditingController()      ;
    noticeTowCon =  TextEditingController()      ;
    await getAddresses()                         ;
    super.onInit()                               ;
  }
  @override
  changeRadioSelectedVal(String val) {
    radioSelectedVal = val   ;
    update()                 ;
  }

  @override
  getAddresses() async{
    statusRequestAddress = StatusRequest.loading  ;
    update()                                      ;
    var response = await billingData.getUserAddresses(userId) ;
    statusRequestAddress = handling(response)     ;
    if(statusRequestAddress==StatusRequest.success){
      if(response['status']=='success') {
         address = response['data']   ;
         addressTitles = []           ;
         for (var jsonAddress in address) {
           addressTitles.add(Address.fromJson(jsonAddress).addressName.toString());
         }
         selectedAddress   = addressTitles[0]  ;
         selectedAddressId = Address.fromJson(address[0]).addressId.toString()  ;
      }
      else{
        addressTitles   = [''] ;
        selectedAddress = ''   ;
        statusRequestAddress = StatusRequest.noData   ;
        update()                                      ;
      }
    }
    else{
      getAddresses()   ;
    }
    update()           ;
  }

  @override
  selectedNewAddress(String? newVal) {

    selectedAddress = newVal.toString()     ;
    for (var addressJson in address) {
      if(Address.fromJson(addressJson).addressName == selectedAddress){
        selectedAddressId = Address.fromJson(addressJson).addressId.toString() ;
        break      ;
      }
    }
    update()                                ;
  }
  @override
  sendOrder() async{
    statusRequestSendOrder = StatusRequest.loading  ;
    update()                                        ;
      if(toListPublicCarts().length==1){
        var response = await billingData.sendOrder(
            userId      ,
            CartModel.fromJson(toListPublicCarts()[0]).mealModel!.mealId.toString()      ,
            CartModel.fromJson(toListPublicCarts()[0]).count.toString()  ,
            selectedAddressId

        )   ;
        statusRequestSendOrder=handling(response) ;
        if(statusRequestSendOrder==StatusRequest.success){
          if(response['status']=='success'){
            deleteAMealFromCart(CartModel.fromJson(toListPublicCarts()[0]).mealModel!.mealId.toString() ) ;
            Get.offNamed(HomeScreen.id) ;
          }
        }
      }else{
        var response = await billingData.sendOrder(
            userId      ,
            CartModel.fromJson(toListPublicCarts()[0]).mealModel!.mealId.toString()      ,
            CartModel.fromJson(toListPublicCarts()[0]).count.toString()  ,
            selectedAddressId
        )   ;
        statusRequestSendOrder = handling(response) ;
        if(statusRequestSendOrder==StatusRequest.success){
          if(response['status']=='success'){
            deleteAMealFromCart(CartModel.fromJson(toListPublicCarts()[0]).mealModel!.mealId.toString() ) ;
          }
          statusRequestSendOrder  = StatusRequest.loading  ;
        }
      }

    statusRequestSendOrder = StatusRequest.success ;
    update()  ;
  }
  @override
  void dispose() {
    noticeTowCon.dispose()  ;
    noticeOneCon.dispose()  ;
    super.dispose()         ;
  }

  @override
  deleteAMealFromCart(String mealId) {
    publicCarts.remove(mealId)   ;
  }


}