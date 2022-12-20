
import 'package:beeorder/core/class/shimmerLoading.dart';
import 'package:beeorder/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../constant/appImage.dart';

//this class use for dealing with data without body Login ,SignUp,Auth .... ets
class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const MyLoading()
        : statusRequest == StatusRequest.failure
            ? const ServerFauiler()
            : statusRequest == StatusRequest.serverFailure
                ? const ServerFauiler()
                : widget;
  }
}
class HandlingDataViewShimmer extends StatelessWidget {
  final StatusRequest statusRequest  ;
  final Widget widget                ;
  final Widget?  noDataWidget        ;
  const HandlingDataViewShimmer({
    Key? key,
    required this.statusRequest ,
    required this.widget        ,
    this.noDataWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.success
        ? widget : statusRequest == StatusRequest.noData?
          noDataWidget!:const ShimmerLoadingPage()    ;
  }
}
//==========================================
class HandlingDataViewBeeLoading extends StatelessWidget {
  final StatusRequest statusRequest ;
  final Widget widget               ;
  const HandlingDataViewBeeLoading({
    Key? key,
    required this.statusRequest,
    required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.success ?
    widget:
    const MyLoading()  ;
  }
}



//=======================subclass=====================
class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //add the asset of lottieloadding
    return Center(child: Lottie.asset(AppImage.lottieLoading,height: Get.height/4 ));
  }
}

class ServerFauiler extends StatelessWidget {
  const ServerFauiler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImage.lottieError,height: Get.height/4,
        fit: BoxFit.fill

            ),
    );
  }
}
