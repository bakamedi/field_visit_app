import 'package:flutter/material.dart';

class CardIconGW extends StatelessWidget {
  const CardIconGW({
    super.key,
    required this.iconData,
    required this.bgColor,
    required this.iconColor,
  });

  final IconData iconData;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(iconData, size: 28, color: iconColor),
    );
  }
}
