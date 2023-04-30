
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({
    Key? key,
    required this.title,
    required this.description,
    this.onPressed,
    this.icon = Icons.keyboard_arrow_right,
    this.iconColor = Colors.black45,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback? onPressed;
  final IconData icon;
  final Color iconColor;

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {

  void onTap() {
    if (kDebugMode) {
      print("${widget.title} was pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(widget.title),
          trailing: Icon(
            widget.icon,
            color: widget.iconColor,
            size: 25.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          tileColor: Colors.white,
          onTap: widget.onPressed ?? onTap,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 5.0),
          child: Text(
            widget.description,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Color(0xFF3B3B3B),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
