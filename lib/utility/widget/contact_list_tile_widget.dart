
import 'dart:math';

import 'package:flutter/material.dart';
import '../../controllers/on_press_action.dart';

class ContactListTileWidget extends StatefulWidget {
  const ContactListTileWidget({Key? key,
    required this.contactName,
    required this.contactPhnNo,
    required this.color0to7,
  }) : super(key: key);


  final String contactName;
  final String contactPhnNo;
  final int color0to7;

  @override
  State<ContactListTileWidget> createState() => _ContactListTileWidgetState();
}

class _ContactListTileWidgetState extends State<ContactListTileWidget> {

  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    if (names.isNotEmpty) {
      initials = names[0][0];
      if (names.length > 1) {
        initials += names[names.length - 1][0];
      }
    }
    return initials;
  }

  List<String> colors = [
    '0xFF3080FF',
    '0xFF32B82E',
    '0xFFE47522',
    '0xFFEBD100',
    '0xFFF75555',
    '0xFFCE4CC8',
    '0xFF717171',
    '0xFF2A33A5',
  ];

// Function to get random color
  Color getColorFromIndex(int index) {
    if (index >= 0 && index < colors.length) {
      String colorString = colors[index];
      int colorValue = int.parse(colorString);
      return Color(colorValue);
    }
    // Return a default color if the index is out of range
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: getColorFromIndex(widget.color0to7),
            child: Text(
              getInitials(widget.contactName),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(widget.contactName),
          subtitle: Text(widget.contactPhnNo),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: 25.0,
          ),
          onTap: OnPressAction.goToContactDetailScreen,
        ),
        const Divider(thickness: 1.0,indent: 15.2,endIndent: 15.2),
      ],
    );
  }
}
