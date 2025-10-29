import 'package:flutter/widgets.dart';

class SelectRoleModel {
  final String title;
  final String subTitle;
  final IconData iconData;
  final String routeName;
  final bool isSelected;

  SelectRoleModel({
    required this.title,
    required this.subTitle,
    required this.iconData,
    required this.routeName,
    this.isSelected = false,
  });
}
