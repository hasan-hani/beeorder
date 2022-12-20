import '../../core/class/crud.dart';
import '../../core/constant/apiLink.dart';
class RegisterData{
  Crud crud ;
  RegisterData(this.crud) ;
  postData(String phone)async{
    var response=await crud.postData(ApiLink.signup, {'phone':phone} )   ;
    return response.fold((l) => l, (r) => r) ;
  }
}

