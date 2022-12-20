import 'mealModel.dart';

class CartModel{
  int? count  ;
  MealModel? mealModel ;
  CartModel({this.count , this.mealModel});
  CartModel.fromJson(Map json){
    count     =   json['count']   ;
    mealModel = json['mealModel'] ;
  }
}