import 'package:beeorder/controller/profilecontoller/myAddressController.dart';
import 'package:beeorder/data/model/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingData.dart'   ;
import '../../../core/constant/appColor.dart';
List address=[
  {
    "address_id": 1,
    "address_name": "الاول",
    "address_regon": "المجتهد",
    "address_street": "المجتهد",
    "address_flat": "الثاني",
    "address_nearto": "المجتهد",
    "address_details": "المجتهد",
    "address_user": 1,
    "address_lat": "",
    "address_lang": ""
  },
  {
    "address_id": 2,
    "address_name": "الثاني",
    "address_regon": "المجتهد",
    "address_street": "المجتهد",
    "address_flat": "الثاني",
    "address_nearto": "المجتهد",
    "address_details": "المجتهد",
    "address_user": 1,
    "address_lat": "",
    "address_lang": ""
  }
];

class MyAddressWidget extends GetView<MyAddressControllerImp> {
  const MyAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyAddressControllerImp())    ;
    return Expanded(
      child: GetBuilder<MyAddressControllerImp>(
        builder: (controller) {
          return HandlingDataViewShimmer(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.addresses.length  ,
                itemBuilder: (context, index) {
                  return AddressCard(
                      address: Address.fromJson(controller.addresses[index]),
                      deleteAddress: (){
                        controller.deleteAddress(
                            Address.fromJson(controller.addresses[index]).addressId.toString()
                        );
                      }
                  );
                },
              ));
        }
      ),
    );
  }
}
class AddressCard extends StatelessWidget {
  final Address address ;
  final void Function() deleteAddress ;
  const AddressCard(
      {Key? key, required this.address, required this.deleteAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
      width: double.maxFinite ,
      child: Card(
        child: ListTile(
          leading:const Icon(Icons.location_on_sharp)  ,
          title: Text(address.addressName.toString())  ,
          trailing: IconButton(
            onPressed: deleteAddress ,
            icon: const Icon(Icons.delete_outline_outlined,color: AppColor.secondaryColor,),
          ),
        ),
      ),
    );
  }
}
