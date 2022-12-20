import 'package:beeorder/core/class/statusRequest.dart';

StatusRequest handling(response){
  if(response is StatusRequest){
    return response  ;
  }
  else{
    return StatusRequest.success  ;
  }
}
