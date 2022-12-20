
import 'package:beeorder/core/class/snakBarMessage.dart';
import 'package:beeorder/core/class/statusRequest.dart';
import 'package:beeorder/core/services/Services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' ;

import '../../core/function/getCityid.dart';
import '../../core/function/getGenderid.dart';
import '../../core/function/handlingResponse.dart';
import '../../core/function/translateFun.dart';
import '../../data/model/cityModel.dart';
import '../../data/model/userModel.dart';
import '../../data/remote/editProfileData.dart';
abstract class EditeProfileController extends GetxController{
  getCitiesAndUser()             ;
  chooseCity(String city)        ;
  chooseGender(String gender)    ;
  saveRegisterData()             ;
  getDatePicker(BuildContext cx)                ;
}
class EditProfileControllerImp extends EditeProfileController{
  late GlobalKey<FormState> formState          ;
  late TextEditingController nameCon           ;
  late TextEditingController phoneCon          ;
  late TextEditingController dateOfBirthdayCon ;
  late TextEditingController emailCon          ;
  late String userName =  ''                   ;
  late List<TextEditingController>  listOfController = []    ;
  StatusRequest statusRequest     =  StatusRequest.none      ;
  StatusRequest statusRequestSave =  StatusRequest.none      ;
  MyServices myServices           =  Get.find()              ;
  late DateTime? birthday  ;
  EditProfileData registerAfterApprovData = EditProfileData(Get.find())   ;

  //===================dropdownbutton=============================

  late List<String> listOfCities = []     ;
  late String selectedCity  = 'Damascus'.tr              ;
  late String selectedGender ='male'.tr   ;

  //==================Fun=======================================

  @override
  void onInit()async {
    formState = GlobalKey<FormState>() ;
    nameCon           =  TextEditingController()  ;
    phoneCon          =  TextEditingController()  ;
    dateOfBirthdayCon =  TextEditingController()  ;
    emailCon          =  TextEditingController()  ;
    listOfController = [nameCon,phoneCon,emailCon,dateOfBirthdayCon]        ;
    await getCitiesAndUser()                                                ;
    phoneCon.text    =   myServices.sharedPreferences.getString('phone')!   ;
    nameCon.text     =   userName                                           ;
    listOfController = [ nameCon , phoneCon  , emailCon ,dateOfBirthdayCon ]        ;
    update()  ;
    super.onInit() ;
  }
  @override
  getCitiesAndUser()async {
    var response= await
    registerAfterApprovData.getAllCitiesAndUsers(myServices.sharedPreferences.getString('phone')!);
    print('================response $response======================') ;
    statusRequest = handling(response)    ;
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        listOfCities=[] ;
        for (var json in (response['cities'] as List)) {
          listOfCities.add(
              translate(
              ar: CityModel.fromJson(json).citiesName.toString(),
              en: CityModel.fromJson(json).citiesNameEn.toString()
          )
          ) ;
        }
        print('============$listOfCities===========');
        selectedCity = listOfCities.first  ;
        Map<String, dynamic> json =response['registerdata'][0] ;
        UserModel userModel = UserModel.fromJson(json) ;
        userName= userModel.usersName.toString();

      }
    }
  }
  @override
  chooseCity(String city) {
    selectedCity = city ;
    update()            ;
  }
  @override
  chooseGender(String gender) {
    selectedGender = gender ;
    update()  ;
  }
  @override
  saveRegisterData() async{
    if(formState.currentState!.validate()){
      statusRequestSave =StatusRequest.loading    ;
      update()                                    ;
      var response = await registerAfterApprovData.saveRegisterData(
        phone       : phoneCon.text                 ,
        userName    : nameCon.text                  ,
        userEmail   : emailCon.text                 ,
        userGender  : getGenderID(selectedGender)   ,
        userCity    : getCityID(selectedCity)       ,
        userBirthday: dateOfBirthdayCon.text        ,
      ) ;

      statusRequestSave = handling(response)  ;
      if(statusRequestSave==StatusRequest.success){
        statusRequestSave=StatusRequest.none ;
        Get.back() ;
      }
      update() ;
      await Future.delayed(const Duration(seconds: 3),() {
        statusRequestSave = StatusRequest.none ;
      },)      ;
      update() ;
    }else{

    }

  }
  @override
  void dispose() {
    nameCon.dispose()            ;
    phoneCon.dispose()           ;
    dateOfBirthdayCon.dispose()  ;
    emailCon.dispose()           ;
    super.dispose();
  }

  @override
  getDatePicker(BuildContext cx)async {
    DateTime? selectedDate=await showDatePicker(
      initialDate: DateTime(2000)  ,
      firstDate  : DateTime(1950)  ,
      lastDate   : DateTime.now().subtract(const Duration(days: 12*365)),
      context    : cx               ,

    ) ;
    if(selectedDate!=null){
    dateOfBirthdayCon.text =
        selectedDate.year.toString()+'-'+selectedDate.month.toString()
            +'-'+selectedDate.day.toString() ;
    }
  }








}