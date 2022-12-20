import 'package:beeorder/core/class/searchResturantMeal/serchDelegateController.dart';
import 'package:flutter/material.dart'                          ;
import 'package:get/get.dart'                                   ;
import '../handlingData.dart'                                   ;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart' ;
import 'SubSearchResultWidget/chooseMealRastaraunt.dart'        ;
import 'SubSearchResultWidget/resultResOrMeal.dart'             ;

class SearchResultWidget extends GetView<SearchDelegateControllerImp> {
   const SearchResultWidget(
     {Key? key,
     }
      ) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchDelegateControllerImp>(
      builder: (controller) {
        return HandlingDataViewShimmer(
            statusRequest: controller.statusRequest,
            widget: Column(
              children:const [
                ChooseMealRestaraunt()    ,
                SizedBox(height: 4,)      ,
                ResultResOrMeal()         ,
              ],
            )
        );
      }
    );
  }
}





