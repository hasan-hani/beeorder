import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/function/getCurrentposition.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/addNewAddressData/AddNewAddressData.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../core/function/handlingResponse.dart';
import '../../view/screen/profilePages/myAddessScreen.dart';

abstract class AddNewAddressController extends GetxController{
  saveNewAddress()  ;
}
class AddNewAddressControllerImp extends AddNewAddressController{
  AddNewAddressData addNewAddressData = AddNewAddressData(Get.find()) ;
  List hints =[
    'addressname'.tr     ,
    'regain'     .tr     ,
    'street'     .tr     ,
    'float'      .tr     ,
    'nearto'     .tr     ,
    'details'    .tr
  ];
  StatusRequest statusRequest         = StatusRequest.success  ;
  StatusRequest positionStatusRequest = StatusRequest.loading  ;
  MyServices myServices = Get.find()                   ;
  List keyboardControllers  =   []                     ;
  Position? position                                   ;
  late String userID                                   ;

  late GlobalKey<FormState>  globalKey                 ;
  late TextEditingController addressNameCon            ;
  late TextEditingController addressRegainCon          ;
  late TextEditingController addressStreetCon          ;
  late TextEditingController addressFlatCon            ;
  late TextEditingController addressNearToCon          ;
  late TextEditingController addressDetailsCon         ;
  LatLng latLng = LatLng(33.4328672, 36.2668554)       ;
  @override
  void onInit()async {
    userID  = myServices.sharedPreferences.getString('id')!  ;
    globalKey          = GlobalKey<FormState>()   ;
    addressNameCon     = TextEditingController()  ;
    addressRegainCon   = TextEditingController()  ;
    addressStreetCon   = TextEditingController()  ;
    addressFlatCon     = TextEditingController()  ;
    addressNearToCon   = TextEditingController()  ;
    addressDetailsCon  = TextEditingController()  ;
    keyboardControllers=[
      addressNameCon,addressRegainCon,addressStreetCon,
      addressFlatCon,addressNearToCon,addressDetailsCon
    ]    ;
    //getCurrentPosition() is function to ensure the gps is enable and to ask permision if not enable
    position = (await getCurrentPosition() is Position)?await getCurrentPosition():null ;
    super.onInit() ;
  }
  @override
  void onReady() {
    if(position!=null)
    {
      latLng = LatLng(position!.latitude, position!.longitude) ;
    }
    positionStatusRequest = StatusRequest.success  ;
    update()         ;
    super.onReady()  ;
  }
  @override
  saveNewAddress()async {
    if(globalKey.currentState!.validate()){
      statusRequest =StatusRequest.loading   ;
      update()                               ;

      var response = await addNewAddressData.addNewAddress(
        name   : addressNameCon.text                       ,
        details: addressDetailsCon.text                    ,
        flat   : addressFlatCon.text                       ,
        lang   : position!.longitude.toString()            ,
        lat    : position!.latitude.toString()             ,
        nearto : addressNearToCon.text                     ,
        region : addressRegainCon.text                     ,
        street : addressStreetCon.text                     ,
        userid : userID                                    ,
      ) ;
      statusRequest   = handling(response)      ;
      if(statusRequest==StatusRequest.success){
        if(response['status']=='success'){
          Get.offNamed(MyAddressScreen.id)      ;
        }
      }
      statusRequest = StatusRequest.success     ;
      update()                                  ;
    }
  }
}