import '../../core/class/crud.dart';
import '../../core/constant/apiLink.dart';

class OtpData {
  Crud crud ;
  OtpData(this.crud);
  checkCode(String userId , String verCode)async{
    var response = await crud.postData(
        ApiLink.verification ,
        {
          'vercode': verCode ,
          'userid' : userId
        }
    )  ;
    return response.fold((l) => l, (r) => r) ;
  }
}