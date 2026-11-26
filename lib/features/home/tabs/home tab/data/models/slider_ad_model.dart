import 'package:flutter/material.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';

class SliderAdItem {
  final String background;
  final String image;
  final String title;
  final String subtitle;
  final String button;

  final Color titleColor;
  final Color subtitleColor;
  final Color buttonTextColor;
  final Color buttonBgColor;

  final String routeName;

  const SliderAdItem({
    required this.background,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.button,
    required this.routeName,
    this.titleColor = Colors.white,
    this.subtitleColor = const Color(0xE6FFFFFF),
    this.buttonTextColor = AppColors.primary,
    this.buttonBgColor = Colors.white,
  });
}