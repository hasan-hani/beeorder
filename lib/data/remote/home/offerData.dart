import 'package:beeorder/core/class/crud.dart';

import '../../../core/constant/apiLink.dart';

class OfferData{
  Crud crud ;
  OfferData(this.crud);
  getOfferedMeal()async{
    var    response  =  await crud.postData(ApiLink.offer, {}) ;
    return response.fold((l) => l, (r) => r)  ;

  }
}