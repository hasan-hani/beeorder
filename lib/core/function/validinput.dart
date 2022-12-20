import 'package:get/get.dart';

validInput(String value , String type){
  if(type=='phone'){
    return value.isPhoneNumber ;
  }
  if(value.isEmpty){
    return 'please input a value' ;
  }
  if( value.length < 2 || value.length >10 ){
    return 'enter value more 2 and less 10' ;
  }

}