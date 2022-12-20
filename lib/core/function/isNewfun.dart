bool isNewFun(DateTime dateTime){
  return dateTime.isAfter(DateTime.now().subtract(const Duration(days: 60)));
}