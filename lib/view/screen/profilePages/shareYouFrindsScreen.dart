import 'package:beeorder/controller/profilecontoller/shareYourFriendsController.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart'          ;
import 'package:get/get.dart';
import '../../../core/class/handlingData.dart'  ;
class ShareYourFreindsScreen extends GetView<ShareYourFriendControllerImp> {
  static String id='/ShareYourFreindsScreen' ;
  const ShareYourFreindsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShareYourFriendControllerImp());
    return Scaffold(
      body: GetBuilder<ShareYourFriendControllerImp>(
        builder: (controller) {
          return HandlingDataViewShimmer(
            statusRequest:controller.statusRequestContact ,
            widget:Center(
              child: ListView.builder(
                itemCount: controller.contacts.length ,
                  itemBuilder: (context, index) {
                    return ContactCard(contact: controller.contacts[index],);
                  },
              ),
            ),
          );
        }
      ),
    );
  }
}
class ContactCard extends StatelessWidget {
  final Contact contact ;
  const ContactCard({
    Key? key,
    required this.contact
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.displayName.toString()),);
  }
}
