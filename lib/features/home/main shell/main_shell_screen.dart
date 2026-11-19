import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/features/home/tabs/home tab/presentation/screens/home_screen.dart';
import 'package:universitys_gate/features/home/tabs/my applications tab/presentation/screens/my_applications_screen.dart';
import 'package:universitys_gate/features/home/tabs/notifications tab/presentation/screens/notifications_screen.dart';
import 'package:universitys_gate/features/home/tabs/profile tab/presentation/screens/profile_screen.dart';
import 'package:universitys_gate/features/home/tabs/universities tab/presentation/screens/universities_screen.dart';

class MainShellScreen extends StatefulWidget {
  static const String routeName = RouteNames.mainShell;

  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    UniversitiesScreen(),
    MyApplicationsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  final List<_NavItemData> _navItems = const [
    _NavItemData(
      labelKey: 'nav.home',
      icon: HugeIcons.strokeRoundedHome01,
      activeIcon: HugeIcons.strokeRoundedHome02,
    ),
    _NavItemData(
      labelKey: 'nav.universities',
      icon: HugeIcons.strokeRoundedUniversity,
      activeIcon: HugeIcons.strokeRoundedMortarboard01,
    ),
    _NavItemData(
      labelKey: 'nav.my_applications',
      icon: HugeIcons.strokeRoundedTask01,
      activeIcon: HugeIcons.strokeRoundedTaskDone01,
    ),
    _NavItemData(
      labelKey: 'nav.notifications',
      icon: HugeIcons.strokeRoundedNotification01,
      activeIcon: HugeIcons.strokeRoundedNotification02,
    ),
    _NavItemData(
      labelKey: 'nav.profile',
      icon: HugeIcons.strokeRoundedUser,
      activeIcon: HugeIcons.strokeRoundedUserAccount,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final barBgColor = isDark ? DarkAppColors.surface : Colors.white;
    final blueCircleColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final unselectedColor =
    isDark ? DarkAppColors.textMuted : AppColors.textSecondary;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          child: SizedBox(
            height: 82.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // رسم المستطيل المقصوص بالقوس الغائر
                Positioned(
                  top: 12.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipPath(
                    clipper: _NotchedBarClipper(
                      index: _selectedIndex,
                      itemCount: _navItems.length,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: barBgColor,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withValues(alpha: 0.3)
                                : AppColors.primary.withValues(alpha: 0.12),
                            blurRadius: 16.r,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // الأيقونات والنصوص
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_navItems.length, (index) {
                      final isSelected = _selectedIndex == index;
                      final item = _navItems[index];

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              if (isSelected)
                                Positioned(
                                  top: -10.h,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeOutBack,
                                    width: 68.r,
                                    height: 68.r,
                                    decoration: BoxDecoration(
                                      color: blueCircleColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: blueCircleColor.withValues(alpha: 0.38),
                                          blurRadius: 12.r,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        HugeIcon(
                                          icon: item.activeIcon,
                                          size: 24.r,
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 2.h),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                                            child: Text(
                                              item.labelKey.tr(),
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      HugeIcon(
                                        icon: item.icon,
                                        size: AppDimensions.iconMedium.r,
                                        color: unselectedColor,
                                      ),
                                      SizedBox(height: 4.h),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                                          child: Text(
                                            item.labelKey.tr(),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: unselectedColor,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotchedBarClipper extends CustomClipper<Path> {
  final int index;
  final int itemCount;

  _NotchedBarClipper({
    required this.index,
    required this.itemCount,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final itemWidth = size.width / itemCount;
    final cX = itemWidth * (index + 0.5);

    const radius = 34.0;
    const curveWidth = 24.0;

    path.moveTo(0, 0);
    path.lineTo(cX - radius - curveWidth, 0);

    path.cubicTo(
      cX - radius - (curveWidth / 2),
      0,
      cX - radius,
      radius * 0.7,
      cX - radius + 6,
      radius * 0.7,
    );

    path.arcToPoint(
      Offset(cX + radius - 6, radius * 0.7),
      radius: const Radius.circular(radius),
      clockwise: false,
    );

    path.cubicTo(
      cX + radius,
      radius * 0.7,
      cX + radius + (curveWidth / 2),
      0,
      cX + radius + curveWidth,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_NotchedBarClipper oldDelegate) {
    return oldDelegate.index != index || oldDelegate.itemCount != itemCount;
  }
}

class _NavItemData {
  final String labelKey;
  final List<List<dynamic>> icon;
  final List<List<dynamic>> activeIcon;

  const _NavItemData({
    required this.labelKey,
    required this.icon,
    required this.activeIcon,
  });
}