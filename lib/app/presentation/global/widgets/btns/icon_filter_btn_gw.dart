import 'package:flutter/material.dart';

class IconFilterBtnGW extends StatelessWidget {
  const IconFilterBtnGW({super.key, this.onTap, required this.filter});

  final void Function()? onTap;
  final bool filter;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: primaryColor.withValues(alpha: 0.6),
        radius: 15,
        child: Icon(
          filter ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
          size: 15,
        ),
      ),
    );
  }
}
