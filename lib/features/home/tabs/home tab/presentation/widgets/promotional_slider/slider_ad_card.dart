import 'package:easy_localization/easy_localization.dart' hide TextDirection;import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/data/models/slider_ad_model.dart';


class SliderAdCard extends StatelessWidget {
  final SliderAdItem ad;
  final bool isRtl;
  final VoidCallback onTap;

  const SliderAdCard({
    super.key,
    required this.ad,
    required this.isRtl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  ad.background,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const ColoredBox(
                      color: Color(0xFF2563EB),
                    );
                  },
                ),
              ),

              // Illustration Image
              Positioned(
                left: isRtl ? 5.w : null,
                right: isRtl ? null : 5.w,
                bottom: 0,
                width: 200.w,
                height: 150.h,
                child: Image.asset(
                  ad.image,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),

              // Advertisement Content
              Positioned(
                top: 28.h,
                right: isRtl ? 16.w : 145.w,
                left: isRtl ? 145.w : 16.w,
                child: Directionality(
                  textDirection: isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        ad.title.tr(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ad.titleColor,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      // Subtitle
                      Text(
                        ad.subtitle.tr(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.sp,
                          height: 1.5,
                          color: ad.subtitleColor,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Button
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 7.h,
                        ),
                        decoration: BoxDecoration(
                          color: ad.buttonBgColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          ad.button.tr(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: ad.buttonTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}