import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/authContoller/registerInformationController.dart';
import '../../../core/class/handlingData.dart';
import '../../../core/constant/appview.dart';
import '../../widget/publicwidget/buplicTextFormField.dart';
import '../../widget/publicwidget/publicButton.dart';
import '../../widget/publicwidget/publicDropDownButtonFormField.dart';

class RegisterInformationScreen
    extends GetView<RegisterInformationControllerImp> {
  static String id = '/RegisterInformationScreen';
  const RegisterInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterInformationControllerImp());
    return SafeArea(child: Scaffold(
      body: GetBuilder<RegisterInformationControllerImp>(builder: (controller) {
        return HandlingDataViewBeeLoading(
            statusRequest: controller.statusRequestSendInfo,
            widget: Center(
              child: HandlingDataViewShimmer(
                statusRequest: controller.statusRequestCity ,
                widget: Container(
                  decoration: AppView.backgroundImage,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: controller.globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PublicTextFormField(
                          hint: 'name'.tr  ,
                          con: controller.nameCon,
                        ),
                        const SizedBox(
                          height: 15,
                        )     ,
                        PublicDropDownButtonFormField(
                          selectedValue: controller.selectedCity ,
                          items: controller.cityNames            ,
                          onChanged: (city) {
                            controller.chooseCity(city);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PublicDropDownButtonFormField(
                          selectedValue: controller.selectedGender  ,
                          items: controller.genders                 ,
                          onChanged: (gender) {
                            controller.chooseGender(gender) ;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PublicButton(
                          title: 'next'.tr,
                          onTap: controller.sendInformation ,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        );
      }),
    )
    );
  }
}
