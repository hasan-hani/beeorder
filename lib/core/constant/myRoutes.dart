import 'package:beeorder/view/screen/billingcart/billingScreen.dart';
import 'package:beeorder/view/screen/billingcart/cartScreen.dart';
import 'package:beeorder/view/screen/homeScreen.dart';
import 'package:beeorder/view/screen/auth/otpScreen.dart';
import 'package:beeorder/view/screen/splashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../view/screen/addressScreen/addNewAddressScreen.dart';
import '../../view/screen/addressScreen/resturantAddressScreen.dart';
import '../../view/screen/mealDetailsScreen.dart';
import '../../view/screen/profilePages/myAddessScreen.dart';
import '../../view/screen/profilePages/myOrder.dart';
import '../../view/screen/profilePages/settingsScreen.dart';
import '../../view/screen/profilePages/shareYouFrindsScreen.dart';
import '../../view/screen/profilePages/editProfile.dart';
import '../../view/screen/auth/registerByPhoneScreen.dart';
import '../../view/screen/auth/registerInformationScreen.dart';
import '../../view/screen/restaurantServicesScreen.dart';
import '../middleWire/myMiddleWare.dart';

List<GetPage<dynamic>> myRoutes= [
  GetPage(name: SplashScreen.id        , page: ()=> const SplashScreen()      ) ,
  GetPage(middlewares: [MyMiddleWare()], name: RegisterByPhoneScreen.id , page: ()=> const RegisterByPhoneScreen()    ) ,
  GetPage(name:EditProfileScreen.id    , page: () => const EditProfileScreen()    ),
  //============================homepages===============================
  GetPage(name: HomeScreen.id        , page: ()=> const HomeScreen()        ) ,
  GetPage(name: OtpScreen.id         , page: ()=> const OtpScreen()         ) ,
  GetPage(name: MealDetailsScreen.id , page: ()=> const MealDetailsScreen() ) ,
  //===============================profileScreens=====================================
  GetPage(name: MyAddressScreen.id           , page: ()=> const MyAddressScreen()        ) ,
  GetPage(name: MyOrderScreen.id             , page: ()=> const MyOrderScreen()          ) ,
  GetPage(name: MySettings.id                , page: ()=> const MySettings()       ) ,
  GetPage(name: ShareYourFreindsScreen.id    , page: ()=> const ShareYourFreindsScreen()    ) ,

  //===============================resturan screeen=====================================
  GetPage( name: ResturantServicesScreen.id  , page: ()=>const  ResturantServicesScreen()     ) ,


  //==============================address screen===================================
  GetPage(name: AddNewAddressScreen.id     , page: ()=> const AddNewAddressScreen()),

  GetPage(name: ResturantAddressScreen.id  , page: ()=> const ResturantAddressScreen()),
  //==============================address screen==============================


  //==============================Cart screen===================================
  GetPage(name: CartScreen.id   , page: ()=> const CartScreen() ) ,
  //==============================Cart screen===================================
  //==============================Billing Screen=====================
  GetPage(name:BillingScreen.id , page: ()=>const BillingScreen() ),
  //==============================Billing Screen=====================
  //==========================RegisterInformationScreen================
  GetPage(name: RegisterInformationScreen.id, page: ()=>const RegisterInformationScreen())  ,
  //==========================RegisterInformationScreen=========================

];