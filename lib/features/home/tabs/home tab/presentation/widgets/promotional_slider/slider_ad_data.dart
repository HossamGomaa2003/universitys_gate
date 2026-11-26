import 'package:flutter/material.dart';

import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/data/models/slider_ad_model.dart';

class SliderAdData {
  static const List<SliderAdItem> ads = [
    // Advertisement 1: Scholarships
    SliderAdItem(
      background: 'assets/images/card_1.png',
      image: 'assets/images/slider_1.png',
      title: 'home.card2_title',
      subtitle: 'home.card2_desc',
      button: 'home.card2_button',
      titleColor: Colors.white,
      subtitleColor: Color(0xFFBAE6FD),
      buttonTextColor: Color(0xFF0F52BA),
      buttonBgColor: Colors.white,
      routeName: RouteNames.universities,
    ),

    // Advertisement 2: Online Application
    SliderAdItem(
      background: 'assets/images/card_2.png',
      image: 'assets/images/slider_2.png',
      title: 'home.card1_title',
      subtitle: 'home.card1_desc',
      button: 'home.start_now',
      titleColor: Color(0xFF0F172A),
      subtitleColor: Color(0xFF1E3A8A),
      buttonTextColor: Colors.white,
      buttonBgColor: Color(0xFF2563EB),
      routeName: RouteNames.myApplications,
    ),

    // Advertisement 3: Track Application
    SliderAdItem(
      background: 'assets/images/card_3.png',
      image: 'assets/images/slider_3.png',
      title: 'home.card4_title',
      subtitle: 'home.card4_subtitle',
      button: 'home.card4_button',
      titleColor: Colors.white,
      subtitleColor: Color(0xFFE0F2FE),
      buttonTextColor: Color(0xFF1E40AF),
      buttonBgColor: Colors.white,
      routeName: RouteNames.myApplications,
    ),

    // Advertisement 4: Universities
    SliderAdItem(
      background: 'assets/images/card_4.png',
      image: 'assets/images/slider_4.png',
      title: 'home.card3_title',
      subtitle: 'home.card3_desc',
      button: 'home.card3_button',
      titleColor: Color(0xFF0F172A),
      subtitleColor: Color(0xFF334155),
      buttonTextColor: Colors.white,
      buttonBgColor: Color(0xFF0284C7),
      routeName: RouteNames.universities,
    ),
  ];
}