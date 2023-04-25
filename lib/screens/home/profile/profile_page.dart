import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: jAppbarProfilePageTitle,centerTitle: false,automaticallyImplyLeading: true,actions: []),
      body: Center(
        child: IconButton(
          alignment: Alignment.center,
          onPressed: (){},
          iconSize: 40.0,
          icon: Icon(
            Icons.access_alarm,
          ),
        ),
      ),
    );
  }
}
