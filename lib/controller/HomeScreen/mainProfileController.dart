import 'package:beeorder/core/services/Services.dart'            ;
import 'package:get/get.dart'                                    ;
import 'package:flutter_svg/flutter_svg.dart'                    ;
import '../../core/constant/appImage.dart'                       ;
import '../../core/function/IsLoginFun.dart'                     ;
import '../../core/snackBarAndDailogeMessages/snakBarMessageNoAccount.dart';
import '../../view/screen/profilePages/myAddessScreen.dart'      ;
import '../../view/screen/profilePages/myOrder.dart'             ;
import '../../view/screen/profilePages/settingsScreen.dart'      ;
import '../../view/screen/profilePages/shareYouFrindsScreen.dart';
import '../../view/screen/profilePages/editProfile.dart'         ;
import 'package:flutter/material.dart'                           ;

abstract class MainProfileController extends GetxController{
  chooseImageProfile()          ;
  goToEditProfileScreen()       ;
  goToMyOrderScreen()           ;
  goToMyAddressScreen()         ;
  goTOMySettingsScreen()        ;
  goToShareYourFriendsScreen()  ;
}
class MainProfileControllerImp extends MainProfileController{
  late String selectedProfileImage = AppImage.secondImageSvg ;
  List<String> listOfMainTitle    =  ['8'.tr,'9'.tr  ,'10'.tr ,'11'.tr,'12'.tr] ;
  List<String> listOfSubTitle     =  [  ''  ,'13'.tr ,'14'.tr , '' , '' ]       ;
  MyServices myServices           = Get.find()    ;
  List<void Function()> listOfFun = [] ;
  List<String> listOfImageProfile = [
    AppImage.firstImageSvg  , AppImage.secondImageSvg , AppImage.thirdImageSvg ,
    AppImage.fourthImageSvg , AppImage.fiveImageSvg   , AppImage.sexImageSvg
  ]                         ;
  @override
  chooseImageProfile(){
    Get.snackbar('', 'choose image',
        duration: const Duration(seconds: 5)  ,
        snackPosition: SnackPosition.BOTTOM   ,
        maxWidth:double.maxFinite             ,
        titleText: SizedBox(
          height: 104                         ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              SizedBox(
                height: 50                                    ,
                child: Row(
                  children: [
                    ...List.generate(
                        3, (index) =>
                        Expanded(
                            child: InkWell(
                                onTap:() {
                                  selectedProfileImage=listOfImageProfile[index] ;
                                  Get.closeCurrentSnackbar() ;
                                  update()  ;
                                },
                                child: SvgPicture.asset(listOfImageProfile[index],fit: BoxFit.fill,),
                            )
                        )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    ...List.generate(
                        3, (index) =>
                         Expanded(child: InkWell(
                           onTap: (){
                             selectedProfileImage=listOfImageProfile[index+3] ;
                             Get.closeCurrentSnackbar() ;
                             update()  ;
                           },
                             child: SvgPicture.asset(listOfImageProfile[index+3],fit: BoxFit.fill,))))
                  ],
                ),
              ),
            ],
          ),
        )
    )                  ;
  }
  @override
  void onInit() {
    listOfFun = [
      goToEditProfileScreen                ,
      goToMyOrderScreen                    ,
      goToMyAddressScreen                  ,
      goTOMySettingsScreen                 ,
      goToShareYourFriendsScreen           ,
    ]   ;
    //todo sharedprefrence profile image key
    selectedProfileImage = (myServices.sharedPreferences.getString('imageprofile')?? AppImage.secondImageSvg) ;
    super.onInit()        ;
  }

  @override
  goTOMySettingsScreen() {
    Get.toNamed(MySettings.id) ;

  }

  @override
  goToEditProfileScreen() {
    if(isLoginFun()){
      Get.toNamed(EditProfileScreen.id) ;
    }else{
      snakbarMessageNoAccount()  ;
    }
  }

  @override
  goToMyAddressScreen() {
    if(isLoginFun()){
      Get.toNamed(MyAddressScreen.id)  ;
    }else{
      snakbarMessageNoAccount()        ;
    }
  }

  @override
  goToMyOrderScreen() {
    if(isLoginFun()){
      Get.toNamed(MyOrderScreen.id) ;
    }else{
      snakbarMessageNoAccount()  ;
    }
  }

  @override
  goToShareYourFriendsScreen() {
    Get.toNamed( ShareYourFreindsScreen.id ) ;
  }
}