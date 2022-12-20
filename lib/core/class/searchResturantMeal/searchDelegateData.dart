import '../crud.dart';
import '../../constant/apiLink.dart';
class SearchDelegateData{
  Crud crud ;
  SearchDelegateData(this.crud) ;
  getCertineResturant(String restaurantName)async{
    var response = await crud.postData(
        ApiLink.searchedMeal,
        {
          'searchedmeal':restaurantName ,
          'lang':'ar'
        }
    ) ;
    return response.fold((l) => l, (r) => r) ;
  }
}