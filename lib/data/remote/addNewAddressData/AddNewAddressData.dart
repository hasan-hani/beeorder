import '../../../core/class/crud.dart';
import '../../../core/constant/apiLink.dart';

class AddNewAddressData {
  Crud crud                    ;
  AddNewAddressData(this.crud) ;
  addNewAddress(
      {required String name,region,street,nearto,details,userid,lang,lat,flat}
      )async{
    var response = await crud.postData(ApiLink.addNewAddress,
        {
          'name'  : name   ,
          'region':region   ,
          'street':street  ,
          'flat'  :flat    ,
          'nearto':nearto  ,
          'details':details,
          'userid':userid ,
          'lang': lang  ,
          'lat' : lat
        }
    );
    return response.fold((l) => l, (r) => r)  ;
  }

}