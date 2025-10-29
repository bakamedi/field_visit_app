import 'package:flutter/widgets.dart';

class SelectRoleModel {
  final String id;
  final String title;
  final String subTitle;
  final String role;
  final IconData iconData;
  final String routeName;
  final bool isSelected;

  SelectRoleModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.role,
    required this.iconData,
    required this.routeName,
    this.isSelected = false,
  });
}
