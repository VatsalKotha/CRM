import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final List<Enum> options;
  final Enum? groupValue;
  final void Function(Enum?) onChanged;
  final String Function(Enum) textBuilder;
  final String Function(Enum) valueBuilder;

  const RadioButtonWidget({
    Key? key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.textBuilder = defaultTextBuilder,
    this.valueBuilder = defaultValueBuilder,
  }) : super(key: key);

  static String defaultTextBuilder(Enum option) =>
      option.toString().split('.')[1];
  static String defaultValueBuilder(Enum option) => option.toString();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options
          .map(
            (option) => Row(
              children: [
                Radio<Enum>(
                  value: option,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
                Text(textBuilder(option)),
              ],
            ),
          )
          .toList(),
    );
  }
}
