import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonBackgroundColor,
    required this.buttonHeight,
    this.buttonCornerRadius,
    this.onPressed,
    this.buttonTextSize,
    this.marginHorizontal,
    this.marginVertical,
  }) : super(key: key);

  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBackgroundColor;
  final double buttonHeight;
  final double? buttonCornerRadius;
  final VoidCallback? onPressed;
  final double? buttonTextSize;
  final double? marginHorizontal;
  final double? marginVertical;

  void onTap() {
    if (kDebugMode) {
      print("$buttonText button was pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 0, vertical: marginVertical ?? 0),
      child: ElevatedButton(
        onPressed: onPressed ?? onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          minimumSize: Size(double.infinity, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonCornerRadius ?? 10.0),
            side: BorderSide.none,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: buttonTextColor,
            fontSize: buttonTextSize,
          ),
        ),
      ),
    );
  }
}
