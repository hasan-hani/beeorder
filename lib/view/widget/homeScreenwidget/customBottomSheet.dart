import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import '../../../controller/homeController.dart';
import '../../../core/constant/appColor.dart';

class CustomBottomSheet extends GetView<HomeScreenControllerImp> {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Container(
      child: Row(
        children: [
          ...List.generate(4, (index) => BottomSheetItem(
            icon: controller.iconsBottomSheet[index],
            pageName: controller.pageList[index]     ,
            onPressedNavigator: () {controller.selectPageFun(index) ;  },
            isSelected: index==controller.selectedPageIndex,))
        ],
      ) ,
    ),)  ;
  }
}
class BottomSheetItem extends StatelessWidget {
  final void Function() onPressedNavigator ;
  final IconData icon                      ;
  final String pageName                    ;
  final isSelected                         ;
  const BottomSheetItem({Key? key, 
    required this.onPressedNavigator ,
    required this.icon               ,
    required this.pageName           ,
    required this.isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedNavigator,
      child:Column(
        mainAxisSize: MainAxisSize.min ,
        children: [
          Icon(icon,color: isSelected?AppColor.primaryColor:null,)                   ,
          const SizedBox(height: 2,)   ,
          Text(pageName,style: TextStyle(color:isSelected?AppColor.primaryColor:null ),)               ,
        ],
      ) ,
    );
  }
}
