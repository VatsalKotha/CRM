
import 'package:flutter/material.dart';

class AlertBoxWidget extends StatefulWidget {
  const AlertBoxWidget({Key? key}) : super(key: key);

  @override
  State<AlertBoxWidget> createState() => _AlertBoxWidgetState();
}

class _AlertBoxWidgetState extends State<AlertBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
