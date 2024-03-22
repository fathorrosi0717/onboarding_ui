import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:onboarding_ui/logic/app_logic.dart';
import 'package:onboarding_ui/view/app_scaffold.dart';
import 'package:onboarding_ui/view/router.dart';
import 'package:onboarding_ui/view/styles/styles.dart';
import 'package:onboarding_ui/injection.dart' as di;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  di.init();
  runApp(const MyApp());
  await appLogic.bootstap();
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'On Boarding UI',
      theme: ThemeData(
          fontFamily: $styles.text.bodyMedium.fontFamily, useMaterial3: true),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
AppStyle get $styles => AppScaffold.style;
