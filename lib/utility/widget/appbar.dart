import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final Color backgroundColor;
  final double elevation;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyLeading;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.centerTitle = true,
    this.backgroundColor = const Color(0xFFFAFAFA),
    this.elevation = 1.0,
    this.actions,
    this.automaticallyImplyLeading = false,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actionsIconTheme: const IconThemeData(color: Colors.grey),
      elevation: elevation,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions ??
          <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.search),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
