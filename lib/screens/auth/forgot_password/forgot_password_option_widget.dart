import 'package:flutter/material.dart';

class ForgotPasswordOptionWidget extends StatelessWidget {
  const ForgotPasswordOptionWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData btnIcon;
  final String title,subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Icon((btnIcon), size: 40.0,),
            const SizedBox(width: 7.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6,),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
