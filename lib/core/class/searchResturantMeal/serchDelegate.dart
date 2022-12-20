import 'package:beeorder/core/class/searchResturantMeal/searchResultWidget.dart';
import 'package:beeorder/core/class/searchResturantMeal/serchDelegateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SearchResturantMeal extends SearchDelegate{
  SearchDelegateControllerImp controller =Get.put(SearchDelegateControllerImp());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query='' ;
      }, icon: Icon(Icons.close))
    ] ;
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){
      close( context , null ) ;
    }
        ,icon: Icon(Icons.arrow_back)) ;
  }

  @override
  Widget buildResults(BuildContext context) {
    controller.getSearchedVal(query)  ;
    controller.searchMealRestaurant() ;
    return  SearchResultWidget()      ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Container(
      color: Colors.white     ,
      height:double.maxFinite ,
      width:double.maxFinite  ,
      child: Column(
        children: [
          Container(
            height: 75              ,
            width: double.maxFinite ,
            child: Row(
              children: [
                Expanded(child:
                Container(child: Center(child: Text('meal')),),),
                Expanded(child: Container(
                  child: Center(child:Text('resturant')),
                )),
              ],
            ),
          ),
        ],
      )   ,
    );
  }

}