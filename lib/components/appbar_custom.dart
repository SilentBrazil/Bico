import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSize{
  final title;
  final bool withBackButton;

  const AppBarCustom({Key key, this.title, this.withBackButton}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: (withBackButton == null ) ? true : withBackButton,
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
