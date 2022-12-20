class ApiLink{
  static const String baseurl='http://192.168.0.131/server/beeorder' ;

  //=================================Auth==========================

  static const String signup='$baseurl/auth/signup.php'                           ;
  static const String verification = '$baseurl/auth/validationuser.php'  ;
  static const String registerInformation='$baseurl/auth/registercitynamegender.php'    ;
  static const String signupAfterApprove='$baseurl/auth/signUpAfterAppproval.php' ;
  static const String getAllCities = '$baseurl/getAllCities.php'                  ;
  static const String getOnlyCity  = '$baseurl/getonlycities.php'                 ;
  //===========================homeScreen=================================

  static const String home       = '$baseurl/home.php'                       ;
  static const String restaurant = '$baseurl/getallresturant.php'            ;
  static const String offer      = '$baseurl/offer.php'                      ;


  //========================restaurant details============================

  static const String certineResturant    ='$baseurl/getmealforcertinerestaurant.php' ;
  static const String getMealsForCertainService    ='$baseurl//restarant/getmealsforcertineservice.php' ;


  //===============================searchedLink=====================================
  static String searchedMeal = '$baseurl/search/searchmeal.php' ;


  //==============================Address Link===========================
  static String address = '$baseurl/adress.php'                ;

  static String addNewAddress ='$baseurl/addnewaddress.php'    ;
  static String deleteAddress ='$baseurl/deleteaddress.php'    ;

  //==============================Address Link===========================

//==============================favorite======================================//

  static const String addMealToFavorite = '$baseurl/favorite.php'     ;

  static const String addRestaurantToFavorite = '$baseurl/addResturantToFav.php';

//==============================favorite======================================//

  //=====================================billing=========================

   static const String sendOrder = '$baseurl/sendorder.php'            ;


   //=======================================billing=======================

  //=====================================orders Screen=========================

  static const String getMyOrder = '$baseurl/getmyorder.php'            ;


  //=======================================orders screen=======================

  //===========================link image================================//
  static const String imageBaseURL        ='$baseurl/upload'           ;
  static const String imageLinkMeal       ='$imageBaseURL/meal'        ;
  static const String imageLinkRestaurant ='$imageBaseURL/restaurant'  ;



}