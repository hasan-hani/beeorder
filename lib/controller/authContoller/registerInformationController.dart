import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:beeorder/data/remote/registerInformationData.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/function/handlingResponse.dart';
import '../../core/function/translateFun.dart';
import '../../data/model/cityModel.dart';
import '../../view/screen/homeScreen.dart';

abstract class RegisterInformationController extends GetxController{
  sendInformation()             ;
  chooseCity(String? city)      ;
  chooseGender(String? gender)  ;
  getAllCities()                ;
  int getCityId()               ;
  int getGenderId()             ;
}
class  RegisterInformationControllerImp extends RegisterInformationController{
  late GlobalKey<FormState> globalKey                                      ;
  StatusRequest statusRequestCity = StatusRequest.loading       ;
  StatusRequest statusRequestSendInfo = StatusRequest.success   ;
  RegisterInformationData registerInformationData =
  RegisterInformationData(Get.find())               ;
  MyServices myServices = Get.find()                ;
  late TextEditingController nameCon                ;
  late String userName                              ;
  late String userId                                 ;
  String selectedCity = ''                          ;
  String selectedGender   = 'male'.tr               ;
  List cities             = []                      ;
  List<String> cityNames  = ['']                    ;
  List<String> genders = ['male'.tr,'female'.tr]    ;
  @override
  void onInit() {
    globalKey = GlobalKey<FormState>()              ;
    nameCon   = TextEditingController()  ;
    userId    = myServices.sharedPreferences.getString('id')!  ;
    getAllCities()                     ;
    super.onInit()                     ;
  }
  @override
  sendInformation()async {
    if(globalKey.currentState!.validate()){
      statusRequestSendInfo = StatusRequest.loading ;
      update()                                      ;
      var response = await registerInformationData.registerInf(
          getGenderId().toString(),getCityId().toString(),
          userId , nameCon.text )  ;

      statusRequestSendInfo = handling(response) ;
      if(statusRequestSendInfo==StatusRequest.success){
        if(response['status']=='success'){
          //shared_preference user name key
          myServices.sharedPreferences.setString('name', nameCon.text);
          // step 3 HomeScreen
          myServices.sharedPreferences.setString('step', '3')  ;
          Get.offNamed(HomeScreen.id)  ;
        }
      }
      statusRequestSendInfo = StatusRequest.success ;
      update()  ;
    }

  }

  @override
  chooseCity(String? city) {
    selectedCity = city.toString()  ;
  }

  @override
  chooseGender(String? gender) {
    selectedGender = gender.toString()  ;
    update()                            ;
  }

  @override
  getAllCities()async {
    statusRequestCity = StatusRequest.loading              ;
    update()                                               ;
    var response =await registerInformationData.getOnlyCities() ;
    statusRequestCity = handling(response)                 ;
    if(statusRequestCity==StatusRequest.success){
      if(response['status']=='success'){
        cities = response['data']??[]    ;
        cityNames = [] ;
        for (var cityJson in cities) {
          cityNames.add(translate(
              en: CityModel.fromJson(cityJson).citiesNameEn.toString()  ,
              ar: CityModel.fromJson(cityJson).citiesName.toString()
          )
          );
        }
      }
    }
    else{
      getAllCities()  ;
    }
    selectedCity = cityNames[0]  ;
    update()    ;
  }

  @override
  int getCityId() {
    for (var cityJson in cities) {
      if( translate(ar: CityModel.fromJson(cityJson).citiesName.toString(),
          en: CityModel.fromJson(cityJson).citiesNameEn.toString())==selectedCity ){
        return CityModel.fromJson(cityJson).citiesId! ;
      }
    }
    return 1 ;
  }

  @override
  int getGenderId() {
    return selectedGender=='male'.tr? 0:1  ;
  }
  @override
  void dispose() {
    nameCon.dispose() ;
    super.dispose();
  }
}