import 'package:beeorder/core/class/crud.dart' ;
import '../../core/constant/apiLink.dart'      ;

class MealDetailsData {
  Crud crud                   ;
  MealDetailsData(this.crud)  ;
  addFavorite(String userId ,String mealId)async{
    var response = await crud.postData(
        ApiLink.addMealToFavorite ,
        {
          'mealid':mealId ,
          'userid':userId
    },

    ) ;
    return response.fold( (l) => l , (r) => r ) ;
  }
}