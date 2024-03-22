import 'package:go_router/go_router.dart';
import 'package:onboarding_ui/view/app_scaffold.dart';
import 'package:onboarding_ui/view/onboarding/onboarding_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          GoRoute(
            name: 'onboardingScreen',
            path: '/',
            builder: (context, state) => const OnboardingScreen(),
          ),
        ],
      ),
    ],
  );
}


final router = buildRouter();
