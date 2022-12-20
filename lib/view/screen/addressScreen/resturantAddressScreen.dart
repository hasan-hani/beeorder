import 'package:badges/badges.dart';
import 'package:beeorder/core/function/translateFun.dart';
import 'package:flutter/material.dart'  ;
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:latlong2/latlong.dart';

import '../../../controller/AddressController/restuantAddressController.dart';
import '../../../core/constant/appColor.dart';
import '../../../core/function/getDestanceBetweenTwopoint.dart';
class ResturantAddressScreen extends GetView<RestaurantAddressControllerImp> {
  static String id = '/ResturantAddressScreen'  ;
  const ResturantAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantAddressControllerImp());
    MapController mapController = MapController() ;
    return SafeArea(child: Scaffold(
      body: Center(
        child: GetBuilder<RestaurantAddressControllerImp>(
            builder: (controller) {
              return Badge(
                shape     : BadgeShape.square           ,
                badgeColor: Colors.transparent          ,
                borderRadius: BorderRadius.circular(12) ,
                position: BadgePosition.center()        ,
                badgeContent: Text('${'distance'.tr}:'+getDistanceBetweenTwoPoint(controller.position?.latitude,controller.position?.longitude,double.parse(controller.restaurantModel.restaurantLat!),double.tryParse(controller.restaurantModel.restaurantLong!))+'Km'),
                child: FlutterMap(
                  mapController:mapController ,
                  options: MapOptions(
                    onLongPress: (tapPosition, point) {
                      print(tapPosition) ;
                      print(point)       ;
                    },
                    center:LatLng(
                      33.4324681 ,
                      36.2668337 ,
                    ) ,
                    zoom: 15           ,

                  ),
                  layers: [
                    PolylineLayerOptions(
                      polylines:controller.myPolyline ,

                    ),
                    TileLayerOptions(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',


                    ),
                    MarkerLayerOptions(
                      markers : controller.markers,
                    )
                  ],
                ),
              );
            }
        ) ,
      ),
    )) ;
  }
}
