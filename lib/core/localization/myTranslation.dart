
import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {
        'ar':{
          'distance':'المسافة'        ,
          'k':'كيلو متر'              ,
          'sp':'ل س'                  ,
          's':'حفظ'                   ,
          '1'  : 'اختر اللغة'         ,
          //======================home screen==============================
          'offer':'تخفيض'             ,
          '2'  : 'الرئيسية',
          '3'  : 'المطاعم',
          '4'  : 'العروض',
          '5'  : 'حسابك' ,
          '6'  :  'الاطباق الرائجة',
          '7'  :  'الاطباق جديدة'  ,
          '15' :  'المفضلة'       ,
          //======================home screen==============================

          '8'  :  ' تعديل ملفي الشخصي',
          '9'  :  'طلباتي',
          '10' : 'عناويني',
          '11' : 'الاعدادات'                               ,
          '12' : 'ادع اصدقائك'                            ,
          '13' : 'الاطلاع على الطلبات السابقة'              ,
          '14' : 'اضافة او ازلة عنوان سابق'               ,
          'gender'  : 'جنس'                               ,
          'male'    : 'ذكر'                               ,
          'female'  : 'انثى'                              ,
          'city'    : 'المدينة'                           ,
          'Damascus': 'دمشق'                              ,
          'Aleppo'  : 'حلب'                               ,
          'Latika'  : 'اللاذقية'                           ,
          'Homes'   : 'حمص'                               ,
          'Ham'     : 'حماة'                              ,
          'Tartarus': 'طرطوس'                             ,
          'valueoforder':'قيمة التوصيل'                   ,
          'res'     :'مطعم'                               ,
          'meal':'وجبة'                                   ,
          //==================setting Screen========================
          'arabic':'عربي'                                 ,
          'english':'انكليزي'                             ,
          'contact':'تواصل معنا'                          ,
          'about': 'حول التطبيق'                           ,
          'privicy':'سياسية الخصوصية'                      ,
          'therm'  : 'شروط الاستخدام'                        ,
          'logout':'تسجيل خروج'                             ,

          'choose':'اختر اللغة'                             ,
          'setting':'اعدادات'                               ,

          'notice' : 'ملاحظة'                                 ,
          'you cant buy without account':'لايمكنك الشراء دون حساب ' ,
          //==================setting Screen========================
          //=====================================================
          //===================My Address Screen===================================
          'myaddress':'عناويني'                            ,
          'addnewaddress':'اضافة عنوان جديد'               ,
          //===================My Address Screen===================================

          //=====================Add MY Address screen========================
          'addressname':'اضافة عنوان'          ,
          'regain'   :'المنطقة'                ,
          'street'   :'الشارع'                 ,
          'float'    :'الشقة'                  ,
          'nearto'   :'قريب من'                ,
          'details'  :'التفاصيل'               ,
          //=====================Add MY Address screen========================
          //============================Meal Details screen=========================
          'addcart' :  'اضف الى السلة'   ,
          'showcart': 'عرض السلة'       ,
          //============================Meal Details screen==========================//======================

          //========================cart screen========================//
          'cart':'سلتك'                    ,
          'cost':'التكلفة'                 ,
          'addDishe':'اضافة اطباق اضافية'  ,
          'continue':'تابع'                ,
          //========================cart screen========================//
          //==============================Billing Screen=====================//
          'billing':'الفاتورة'                          ,
          'delvierCost':'قيمة التوصيل'                  ,
          'when':'متى'                                  ,
          'fast':'باسرع وقت ممكن'                       ,
          'chooseTime':'اختر الوقت المناسب'             ,
          'title':'العنوان'                             ,
          'notices'  :'ملاحظات'                          ,
          'addnotice':  'اضف ملاحظة'                     ,
          'newnotice':'ملاحظة اضافية'                    ,

          'sendOrder':'ارسل الطلب'                      ,
          //==============================Billing Screen=====================//

          //===========================Order Screen ========================//
          'myorder':'كل الطلبات'                                       ,
          //===========================Order screen ========================//

          //==============================register information===================
          'next':'التالي'   ,
          'name':'الاسم'     ,
          //==============================register information==================
          //===============snakeBarMessage And dialogue====================
          '16':'تنبيه'                                      ,
          '17':'لايمكن القيام بهذه العملية دون حساب'         ,

          '18':'يرجى تفعيل خدمة الموقع'                     ,
          //===============snakeBarMessage And dialogue====================

        },
        'en':{
          'distance':'distance'       ,
          'k' : 'Km'                  ,
          'sp':'SP'                   ,
          's' :'save'                 ,
          '1' : 'choose Language'     ,
          //======================home screen==============================
          'offer':'offer'             ,
          '2' : 'home'                ,
          '3' : 'restaurant'          ,
          '4' : 'offer'               ,
          '5' : 'account'             ,
          '6' :  'popular Meal'       ,
          '7' :  'New Meal'           ,
          '15' :  'My Favorite '      ,
          //======================home screen==============================
          '8' :  'Edit My Profile '   ,
          '9' :  'My Order'           ,
          '10': 'My Address'          ,
          '11': 'Setting'             ,
          '12': 'invite your friend'  ,
          '13': 'view old order'      ,
          '14': 'add new address'     ,
          'gender'  :'gender'                            ,
          'male'    : 'male'                             ,
          'female'  :'female'                            ,
          'city'    :'city'                              ,
          'Damascus':'Damascus'                          ,
          'Aleppo'  :  'Aleppo'                          ,
          'Latika'  :'Latika'                            ,
          'Homes'   :'Homes'                             ,
          'Ham':'Ham'                                    ,
          'Tartarus':'Tartarus'                          ,

          'valueoforder':'Value of order'                ,

          'res'     :'restaruant'                        ,
          'meal'    :'meal'                              ,

          //==================setting Screen========================
          'arabic' : 'arabic'                                 ,
          'english': 'english'                                ,
          'contact': 'contact us'                             ,
          'about'  : 'about app'                              ,
          'privicy': 'privice policy '                        ,
          'therm'  : 'condition use'                          ,
          'logout' : 'Log out'                                ,
          'choose' : 'choose language'                        ,
          'setting': 'settings'                               ,
          'notice' : 'notice'                                 ,
          'you cant buy without account':'you cant buy without account' ,
  //==================setting Screen========================

          //===================My Address Screen===================================
          'myaddress':'My Address'                         ,
          'addnewaddress':'Add New Address'                ,
          //===================My Address Screen===================================

          //=====================Add MY Address screen========================
          'addressname':'Address name'        ,
          'regain'   :'regain'                ,
          'street'   :'street'                ,
          'float'    :'float'                 ,
          'nearto'   :'near to'               ,
          'details'  :'details'               ,
          //=====================Add MY Address screen========================


          //============================Meal Details screen=========================
          'addcart':'add to cart'     ,
          'showcart':'show cart'      ,
          //============================Meal Details screen==========================

          //========================cart screen========================//
          'cart':'cart'   ,
          'cost':'cost'   ,
          'addDishe':'add more dishes'  ,
          'continue':'continue'         ,
          //========================cart screen========================//

          //==============================Billing Screen=====================//
          'billing':'Billing'                  ,
          'delvierCost':'Cost Of Delivery'     ,
          'when':'when'                        ,
          'fast':'fasts'                       ,
          'chooseTime':'choose proper time'    ,
          'title':'title'                      ,
          'notices':'notices'                  ,

          'addnotice':  ' Add a notice'                     ,
          'newnotice':   'extra notice'                     ,
          'sendOrder':'send order'                          ,
          //==============================Billing Screen=====================//

          //===========================Order Screen ========================//
          'myorder':'All Orders'                            ,
          //===========================Order screen ========================//
          //==============================register information===================
          'next':'next'   ,
          'name':'name'   ,
          //==============================register information==================
          //===============snakBarMessage And dialogue====================
          '16':'attention'                                 ,
          '17':'you cant not do that without account '     ,
          '18':'please enable the gps'                     ,

          //===============snakBarMessage And dialogue====================

        }  ,
      }
      ;

}