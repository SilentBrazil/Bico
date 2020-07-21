import 'package:flutter/material.dart';

class AppBarCustomReturn extends StatelessWidget implements PreferredSize{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
}
