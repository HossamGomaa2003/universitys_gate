import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quick_action_card.dart';

class QuickActionsSection extends StatelessWidget {
  final VoidCallback onViewAll;

  // استقبال الضغط على كل خدمة
  final ValueChanged<int> onServiceTap;

  const QuickActionsSection({
    super.key,
    required this.onViewAll,
    required this.onServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'image': 'assets/images/university_application.png',
        'title': 'home.service_application',
        'subtitle': 'home.service_application_subtitle',
      },
      {
        'image': 'assets/images/universities.png',
        'title': 'home.service_universities',
        'subtitle': 'home.service_universities_subtitle',
      },
      {
        'image': 'assets/images/booking_an_appointment.png',
        'title': 'home.service_booking',
        'subtitle': 'home.service_booking_subtitle',
      },
      {
        'image': 'assets/images/fields_of_study.png',
        'title': 'home.service_fields',
        'subtitle': 'home.service_fields_subtitle',
      },
      {
        'image': 'assets/images/tracking_applications.png',
        'title': 'home.service_tracking',
        'subtitle': 'home.service_tracking_subtitle',
      },
      {
        'image': 'assets/images/required_documents.png',
        'title': 'home.service_documents',
        'subtitle': 'home.service_documents_subtitle',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'home.quick_sections'.tr(),
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),


          ],
        ),

        SizedBox(height: 10.h),

        // Services Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final service = services[index];

            return QuickActionCard(
              imagePath: service['image']!,
              title: service['title']!.tr(),
              subtitle: service['subtitle']!.tr(),
              onTap: () => onServiceTap(index),
            );
          },
        ),
      ],
    );
  }
}