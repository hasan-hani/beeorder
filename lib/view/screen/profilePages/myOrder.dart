import 'package:beeorder/controller/profilecontoller/orderController.dart';
import 'package:flutter/material.dart'         ;
import 'package:get/get.dart'                  ;
import '../../../core/class/handlingData.dart' ;
import '../../../core/constant/appColor.dart';
import '../../../data/model/orderModel.dart';
import '../../widget/publicwidget/cartItem.dart';

class MyOrderScreen extends GetView<OrderControllerImp> {
  static String id='/MyOrderScreen' ;
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp())  ;
    return SafeArea(
      child:Scaffold(
      body: GetBuilder<OrderControllerImp>(
        builder: (controller) {
          return HandlingDataViewShimmer(
            statusRequest: controller.statusRequest ,
            widget:Center(
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('myorder'.tr),
                      ) ,
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.myPreOrders.length ,

                          itemBuilder: (context, index) {
                            return OrderItem(
                              orderModel: OrderModel.fromJson(controller.myPreOrders[index]),
                            );
                          },
                        )
                    
                  ),
  ]
              ),
            ),
    );
        }
      )
      ));
    
  }
}
class OrderItem extends StatelessWidget {
  final OrderModel orderModel  ;
  const OrderItem({Key? key,required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.greyColor ,
      child: ListTile(

        title: Text(orderModel.mealName.toString(),
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold ,
                fontSize: 20
            )),
        leading: Text(orderModel.ordermealDate.toString(),
          style: const TextStyle(color: AppColor.secondaryColor),),
        trailing: Text(orderModel.ordermealCount.toString(),
            style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
