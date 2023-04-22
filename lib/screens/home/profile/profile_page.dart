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
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        actionsIconTheme: const IconThemeData(color: Colors.grey),
        elevation: 1.0,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:10.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
