import '../../core/class/crud.dart';
import '../../core/constant/apiLink.dart';

class RegisterInformationData{
  Crud crud  ;
  RegisterInformationData(this.crud) ;
  getOnlyCities()async{
    var response = await crud.postData(ApiLink.getOnlyCity, {}) ;
    return response.fold((l) => l, (r) => r)  ;
  }
  registerInf(String userGender,String userCity,String userId,String userName)async{
    var response = await crud.postData(
        ApiLink.registerInformation,
        {
          'usergender': userGender ,
          'usercity'  : userCity   ,
          'userid'     : userId      ,
          'username'  : userName   ,
        }
        ) ;


    return response.fold((l) => l, (r) => r) ;
  }
}