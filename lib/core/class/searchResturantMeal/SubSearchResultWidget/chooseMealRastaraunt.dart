import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../serchDelegateController.dart';

class ChooseMealRestaraunt extends GetView<SearchDelegateControllerImp> {
  const ChooseMealRestaraunt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchDelegateControllerImp>(
        builder: (controller) {
          return SizedBox(
            height: 70              ,
            width: double.maxFinite ,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){controller.chooseResMeal(0);},
                    child: Container(
                      height: 70  ,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: controller.selectedResMeal==0? Colors.black:Colors.transparent
                              )
                          )
                      ),
                      child: Center(child: Text('meal'.tr)),
                    ),
                  ),
                ),
                Expanded(
                    child:InkWell(
                      onTap: () {
                        controller.chooseResMeal(1) ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: controller.selectedResMeal==1? Colors.black:Colors.transparent
                                )
                            )
                        ),
                        height: 70  ,
                        child: Center(child: Text('res'.tr)),
                      ),
                    )),

              ],
            ),
          ) ;
        }
    );
  }
}