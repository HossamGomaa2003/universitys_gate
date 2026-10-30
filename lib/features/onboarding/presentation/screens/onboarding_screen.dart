import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:universitys_gate/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:universitys_gate/features/onboarding/presentation/widgets/onboarding_controls.dart';
import 'package:universitys_gate/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:universitys_gate/features/onboarding/presentation/widgets/onboarding_page.dart';



class OnboardingScreen extends StatelessWidget {
  final VoidCallback onFinished;

  const OnboardingScreen({super.key, required this.onFinished});

  Future<void> _finish(BuildContext context) async {
    await context.read<OnboardingCubit>().completeOnboarding();
    if (context.mounted) {
      onFinished();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: BlocProvider(
        create: (_) => OnboardingCubit(),
        child: Builder(
          builder: (context) {
            return IntroductionScreen(
              globalHeader: const OnboardingHeader(),
              globalBackgroundColor: scaffoldBg,
              pages: OnboardingPages(context).listPagesViewModel,
              onChange: (index) {
                context.read<OnboardingCubit>().changePage(index);
              },
              onSkip: () => _finish(context),
              onDone: () => _finish(context),
              showBackButton: true,
              showSkipButton: true,
              showNextButton: true,
              showDoneButton: true,
              back: OnboardingControls.back(context),
              skip: OnboardingControls.skip(context),
              next: OnboardingControls.next(context),
              done: OnboardingControls.done(context),
              backStyle: OnboardingControls.backStyle(context),
              nextStyle: OnboardingControls.nextStyle(context),
              doneStyle: OnboardingControls.doneStyle(context),
              dotsDecorator: OnboardingControls.dotsDecorator(context),
              controlsPadding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 24.h,
              ),
              animationDuration: 400,
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
