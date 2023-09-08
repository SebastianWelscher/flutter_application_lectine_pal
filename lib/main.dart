import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/helper/shared_helper.dart';
import 'package:flutter_application_lectine_pal/homepage.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
    });

    bool isFirstStart =
        SharedHelper.getBoolPreference(preference: 'isFirst') ?? true;
    return MaterialApp(
      initialRoute:
          (isFirstStart) ? RouteGenerator.landing : RouteGenerator.homepage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}
