import 'package:get/get.dart' ;
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

import '../../core/class/statusRequest.dart';
abstract class ShareYourFriendController extends GetxController{
  getContact();
}
class ShareYourFriendControllerImp extends ShareYourFriendController{
  List<Contact> contacts = [] ;
  StatusRequest statusRequestContact = StatusRequest.loading ;
  @override
  void onInit() {
    getContact()   ;
    super.onInit() ;
  }

  @override
  getContact() async{
    print('====================================');
    print(await Permission.contacts.isGranted)   ;

    print('====================================');
    if(!(await Permission.contacts.isGranted)){
      return Permission.contacts.request() ;
    }
    if(!(await Permission.contacts.isGranted)){
      getContact()   ;
    }

    contacts = await ContactsService.getContacts() ;
    if(contacts!=[]){
        statusRequestContact = StatusRequest.success ;
        update()     ;
      }

  }
}