import 'package:flutter/widgets.dart';

class SelectRoleModel {
  final String title;
  final String subTitle;
  final IconData iconData;
  final bool isSelected;

  SelectRoleModel({
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.isSelected = false,
  });
}
