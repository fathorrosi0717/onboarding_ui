import 'package:flutter/material.dart';
import 'package:onboarding_ui/main.dart';
import 'package:onboarding_ui/view/onboarding/component/get_started_btn.dart';
import 'package:onboarding_ui/view/onboarding/component/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      bottomSheet: Container(
        color: const Color(0xFF171717),
        child: isLastPage
            ? const GetStartedButton()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () => pageController
                          .jumpToPage(controller.onBoadingItems.length - 1),
                      child: Text(
                        'Skip',
                        style: $styles.text.labelLarge.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.onBoadingItems.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn),
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Colors.green,
                    ),
                  ),
                  TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      child: Text(
                        'Next',
                        style: $styles.text.labelLarge.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
      ),
      body: PageView.builder(
          onPageChanged: (index) => setState(
              () => isLastPage = controller.onBoadingItems.length - 1 == index),
          itemCount: controller.onBoadingItems.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(controller.onBoadingItems[index].image),
                  SizedBox(
                    height: $styles.insets.xl,
                  ),
                  Text(
                    controller.onBoadingItems[index].title,
                    style: $styles.text.titleLarge.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: $styles.insets.lg,
                  ),
                  Text(
                    controller.onBoadingItems[index].description,
                    style: $styles.text.bodyLarge.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            );
          }),
    );
  }
}
