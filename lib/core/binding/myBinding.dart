import 'package:get/get.dart';

import '../class/crud.dart';
import '../services/Services.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud())   ;
  }

}