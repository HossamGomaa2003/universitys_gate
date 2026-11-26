import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/promotional_slider/slider_ad_card.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/promotional_slider/slider_ad_data.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/promotional_slider/slider_indicators.dart';


class PromotionalSlider extends StatefulWidget {
  const PromotionalSlider({super.key});

  @override
  State<PromotionalSlider> createState() => _PromotionalSliderState();
}

class _PromotionalSliderState extends State<PromotionalSlider> {
  int _currentSliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isRtl = context.locale.languageCode == 'ar';

    final ads = SliderAdData.ads;

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 195.h,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(
              milliseconds: 700,
            ),
            autoPlayCurve: Curves.easeInOutCubic,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSliderIndex = index;
              });
            },
          ),
          items: ads.map((ad) {
            return SliderAdCard(
              ad: ad,
              isRtl: isRtl,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ad.routeName,
                );
              },
            );
          }).toList(),
        ),

        // Slider Indicators
        Positioned(
          top: 12.h,
          right: isRtl ? 15.w : null,
          left: isRtl ? null : 15.w,
          child: SliderIndicators(
            currentIndex: _currentSliderIndex,
            itemCount: ads.length,
          ),
        ),
      ],
    );
  }
}