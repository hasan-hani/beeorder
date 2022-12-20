import 'package:geolocator/geolocator.dart' ;
getDistanceBetweenTwoPoint(double? startLatitude,   double? startLongitude,   double? endLatitude,   double? endLongitude,){
  if(startLatitude==null ||startLongitude==null ||endLatitude==null ||endLongitude==null){
    return 'loading'  ;
  }
  return ((Geolocator.distanceBetween(
      startLatitude  ,
      startLongitude ,
      endLatitude    ,
      endLongitude)  )/1000).toStringAsFixed(3)  ;
}