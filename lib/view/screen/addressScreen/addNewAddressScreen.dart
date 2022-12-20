import 'package:flutter/material.dart'  ;
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/class/handlingData.dart';
import '../../../core/constant/appColor.dart';
import '../../widget/addNewAddressWidgets/cutomDraggableSheet.dart';
import 'package:geolocator/geolocator.dart'       ;
import '../../widget/addNewAddressWidgets/cutomTextFormFieldAddAddress.dart';
import '../../../controller/AddressController/addNewAddressController.dart';
class AddNewAddressScreen extends GetView<AddNewAddressControllerImp> {
  static String id = '/AddNewAddressScreen'     ;
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewAddressControllerImp());
    return Scaffold(
      body: GetBuilder<AddNewAddressControllerImp>(
        builder: (controller) {
          return HandlingDataViewShimmer(
              statusRequest: controller.positionStatusRequest,
              widget: HandlingDataViewBeeLoading(
                statusRequest: controller.statusRequest ,
                widget: Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        center:controller.latLng ,
                        zoom: 15      ,

                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',


                        ),
                        MarkerLayerOptions(
                            markers: [
                              Marker(
                                builder: (context) {
                                  return const Icon(
                                    Icons.pin_drop,color: AppColor.secondaryColor,
                                    size: 50    ,
                                  ) ;
                                },
                                point: controller.latLng      ,
                              )
                            ]
                        )
                      ],


                    ),
                    //======================add google Map=========================
                    const CustomDraggableSheet()         ,
                  ],
                ),
              ));
        }
      ),

    );
  }
}

