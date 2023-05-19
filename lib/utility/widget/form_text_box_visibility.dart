
import 'package:flutter/material.dart';

class FormTextBoxVisibility extends StatefulWidget {
  const FormTextBoxVisibility({
    Key? key,
    required this.formTextBoxWidgets,
  }) : super(key: key);

  final Widget formTextBoxWidgets;

  @override
  State<FormTextBoxVisibility> createState() => _FormTextBoxVisibilityState();
}

class _FormTextBoxVisibilityState extends State<FormTextBoxVisibility> {

  bool widgetVisibility = false;

  void toggleVisibility() {
    setState(() {
      widgetVisibility = !widgetVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: widgetVisibility,
          child: widget.formTextBoxWidgets,
        ),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton(
            onPressed: toggleVisibility,
            child: Text(
              widgetVisibility ? "Show Less" : "Show More",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
