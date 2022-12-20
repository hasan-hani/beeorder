import 'package:beeorder/core/constant/appColor.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../../../core/function/translateFun.dart';
import '../../../data/model/mealModel.dart';
class CartItem extends StatelessWidget {
  final int count                 ;
  final MealModel mealModel       ;
  final void Function()? increase ;
  final void Function()? decrease ;
  final void Function()? delete   ;
  const CartItem(
      {Key? key                    ,
        required this.count        ,
        required this.mealModel    ,
        this.increase              ,
        this.decrease              ,
        this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(mealModel.mealPrice.toString() + 'sp'.tr),
      title: Text(translate(
          ar: mealModel.mealName.toString(),
          en: mealModel.mealNameEn.toString())),
      leading: SizedBox(
        width: 170,
        child: Row(
          children: [
            IconButton(onPressed: increase, icon: const Icon(Icons.add,color: AppColor.secondaryColor,)),
            Text(count.toString()),
            IconButton(onPressed: decrease, icon: const Icon(Icons.remove,color: AppColor.secondaryColor,)),
            IconButton(onPressed: delete, icon: const Icon(Icons.delete,color: AppColor.secondaryColor,)),
          ],
        ),
      ),
    );
  }
}