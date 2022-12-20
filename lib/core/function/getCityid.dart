String getCityID(String city){
  return
  city=='حلب'    || city =='Aleppo'  ?  '2' :
  city=='اللاذقية'|| city =='Latakia' ?  '3' :
  city=='طرطوس'  || city =='Tartarus'?  '4' :
  city=='حمص'    || city =='Homes'   ?  '5' :
  city=='حماة'   || city =='Hom'     ?  '6' :
   '1' ;
}