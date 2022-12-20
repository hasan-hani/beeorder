import 'package:flutter/material.dart';

import '../../../core/constant/appColor.dart';

class CustomProfileItem extends StatelessWidget {
  final String title            ;
  final String subTitle         ;
  final void Function()? onTap  ;
  const CustomProfileItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top:    BorderSide(width: 1,color: Colors.grey  ),
          right:  BorderSide(width: 2,color: Colors.grey  ),
          bottom: BorderSide(width: 1,color: Colors.grey  ),
          left:   BorderSide(width: 2,color: Colors.grey  ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ListTile(
              onTap: onTap,
              title   : Text(title)                          ,
              subtitle: Text(subTitle)                       ,
              trailing: Icon(Icons.arrow_back_ios,color: AppColor.primaryColor,)
          ),


        ],
      ),
    );
  }
}
