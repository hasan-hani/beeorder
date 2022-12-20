import 'dart:async'                                     ;
import 'package:flutter/material.dart'                  ;
import 'package:beeorder/core/class/statusRequest.dart' ;
import 'package:flutter_map/flutter_map.dart'           ;
import 'package:geolocator/geolocator.dart'             ;
import 'package:get/get.dart'                           ;
import 'package:latlong2/latlong.dart'                  ;
import '../../core/constant/appColor.dart'              ;
import '../../core/function/getCurrentposition.dart';
import '../../core/function/translateFun.dart'          ;
import '../../core/snackBarAndDailogeMessages/enableGPSDialoge.dart';
import '../../data/model/resturantModel.dart'           ;


abstract class RestaurantAddressController extends GetxController{

}
class RestaurantAddressControllerImp extends RestaurantAddressController {
  late RestaurantModel restaurantModel                           ;
  StatusRequest statusRequestPosition = StatusRequest.loading    ;
  Position? position                                             ;
  late StreamSubscription<Position> positionStream               ;
  List<Marker>   markers      = []                               ;
  List<Polyline> myPolyline   = []                               ;
  @override
  void onInit() async{
    restaurantModel = Get.arguments['restaurantModel']   ;
    bool serviceEnabled     ;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return enableGPSDialoge() ;
    }

    permission     =  await Geolocator.checkPermission()   ;
    if (permission == LocationPermission.denied) {
      permission   =  await Geolocator.requestPermission() ;
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied') ;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    myPolyline = [
      Polyline(
          isDotted: true               ,
          strokeWidth: 5               ,
          borderStrokeWidth: 5         ,
          color: Colors.black          ,
          borderColor: Colors.blue     ,
          points: [
            // LatLng(double.parse(restaurantModel.restaurantLat!), double.parse(restaurantModel.restaurantLong!)) ,
            LatLng(33.443177 ,33.443177) ,
            LatLng(33.458744 ,36.275859) ,
            LatLng(33.472061 ,36.289714) ,
            LatLng(33.472061 ,36.289714) ,
            LatLng(33.476838 ,36.285921) ,
          ]
      )
    ] ;
    positionStream = Geolocator.getPositionStream().listen((currentPosition) {
      position = currentPosition  ;
      if(position!=null){
        markers = [
          Marker(
            width: 70  ,
            height: 70 ,
            builder: (context) {
              return  Column(
                children: [
                  const Icon(
                    Icons.pin_drop,color: AppColor.primaryColor ,
                    size: 40                                    ,
                  )             ,
                  FittedBox(
                    child: Text(
                      translate(
                          ar: restaurantModel.restaurantName.toString(),
                          en: restaurantModel.restaurantNameEn.toString()
                      ),style:const TextStyle( color: AppColor.secondaryColor ),),
                  )
                ],
              ) ;
            },
            point: LatLng(
              double.tryParse(restaurantModel.restaurantLat!)!,
              double.tryParse(restaurantModel.restaurantLong!)!,
            )     ,
          )  ,
        ]              ;
        markers.add(
            Marker(
                builder: (BuildContext context) {
                  return const Icon(Icons.gps_fixed_rounded) ;
                },
                point: LatLng(position!.latitude,position!.longitude)

            )
        ) ;
      }
      update()                    ;
    });

    super.onInit() ;
  }
  @override
  void dispose() {
    positionStream.cancel()   ;
    super.dispose()           ;
  }
  }