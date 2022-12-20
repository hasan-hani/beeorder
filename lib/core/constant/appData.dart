import 'package:dartz/dartz.dart';

Map<String,Map<String,dynamic>> publicCarts = {} ;

List toListPublicCarts(){
  List<Map<String,dynamic>> carts =[] ;
  publicCarts.forEach(
          (key, value) {
            carts.add(value) ;
          }
          );


  return carts ;
}
