import '../../../core/class/crud.dart';
import '../../../core/constant/apiLink.dart';

class HomeData{
  Crud crud ;
  HomeData(this.crud) ;
  getData(String myId)async{
    var response=await crud.postData(ApiLink.home, {'id':myId})  ;
    return response.fold((l) => l, (r) => r)   ;
  }
  searchData(String searchedMeal)async{
    var response = await crud.postData(
        ApiLink.searchedMeal,
        {'searchedmeal':searchedMeal}
    ) ;
    return response.fold((l) => l, (r) => r) ;
  }
}