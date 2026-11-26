import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';

import 'package:universitys_gate/core/di/injection.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/cubit/home_cubit.dart';


import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/greeting/home_greeting.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/header/home_header.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/promotional_slider/promotional_slider.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/quick_actions/quick_actions_section.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/recent_applications/recent_applications_section.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/presentation/widgets/search/home_search_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = RouteNames.home;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController =
  TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: Scaffold(
        backgroundColor: isDark
            ? DarkAppColors.background
            : const Color(0xFFF1F5F9),

        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 12.h,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header
                const HomeHeader(),

                SizedBox(height: 18.h),

                // 2. Greeting
                const HomeGreeting(),

                SizedBox(height: 20.h),

                // 3. Search Bar
                HomeSearchBar(
                  controller: _searchController,
                ),

                SizedBox(height: 24.h),

                // 4. Quick Actions
                QuickActionsSection(
                  onViewAll: () {
                    // TODO: Navigate to All Services Screen
                  },

                  onServiceTap: (index) {
                    switch (index) {
                      case 0:
                      // University Application
                        break;

                      case 1:
                      // Universities
                        Navigator.pushNamed(
                          context,
                          RouteNames.universities,
                        );
                        break;

                      case 2:
                      // Booking an Appointment
                        break;

                      case 3:
                      // Fields of Study
                        break;

                      case 4:
                      // Tracking Applications
                        Navigator.pushNamed(
                          context,
                          RouteNames.myApplications,
                        );
                        break;

                      case 5:
                      // Required Documents
                        break;
                    }
                  },
                ),

                SizedBox(height: 24.h),

                // 5. Promotional Slider
                const PromotionalSlider(),

                SizedBox(height: 24.h),

                // 6. Recent Applications
                const RecentApplicationsSection(),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}