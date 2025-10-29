import 'package:flutter/material.dart';

class FailureViewData {
  const FailureViewData({
    this.icon,
    required this.message,
    this.errorCode,
    this.title,
  });
  final IconData? icon;
  final String message;
  final String? errorCode;
  final String? title;
}
