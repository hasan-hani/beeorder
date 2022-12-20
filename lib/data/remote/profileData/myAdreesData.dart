import 'package:beeorder/core/class/crud.dart';
import 'package:beeorder/core/constant/apiLink.dart';

class MyAddressData {
  Crud crud ;
  MyAddressData(this.crud) ;
  getAddress(String myId)async{
    var response = await crud.postData(
        ApiLink.address     ,
        { 'id': myId }
    );
    return response.fold((l) => l , (r) => r)   ;
  }
  deleteAddress(String addressID)async{
    var response = await crud.postData(
        ApiLink.deleteAddress , {'id':addressID} ) ;
    return response.fold((l) => l, (r) => r)       ;
  }
}