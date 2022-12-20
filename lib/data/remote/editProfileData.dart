import '../../core/class/crud.dart';
import '../../core/constant/apiLink.dart';

class EditProfileData {
  Crud crud;
  EditProfileData(this.crud);
  getAllCitiesAndUsers(String userPhone) async {
    var response =
        await crud.postData(ApiLink.getAllCities  , {'phone': userPhone} );
    return response.fold((l) => l, (r) => r);
  }
  saveRegisterData ({
    required String phone        ,
    required String userName     ,
    required String userEmail    ,
    required String userGender   ,
    required String userCity     ,
    required String userBirthday ,
  }) async {
    var response =await crud.postData(
        ApiLink.signupAfterApprove,
        {
        'phone'        :  phone         ,
        'username'     :  userName      ,
        'useremail'    :  userEmail     ,
        'usergenderar' :  userGender    ,
        'usercityar'   :  userCity      ,
        'userbirthday' :  userBirthday

        }
    );
    print('response============$response=================')  ;
    return response.fold((l) => l, (r) => r) ;
  }
}
