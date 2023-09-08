import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/homepage.dart';
import 'package:flutter_application_lectine_pal/initpage.dart';
import 'package:flutter_application_lectine_pal/landing.dart';
import 'package:flutter_application_lectine_pal/listpage.dart';
import 'package:flutter_application_lectine_pal/models/listpage_model.dart';
import 'package:flutter_application_lectine_pal/settings.dart';

class RouteGenerator {
  static const String homepage = '/';
  static const String dashboard = '/dashboard';
  static const String landing = '/landing';
  static const String init = '/init';
  static const String settings = '/settings';
  static const String list = '/list';
  //RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings sett) {
    switch (sett.name) {
      case homepage:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Homepage(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: 0.0,
              end: 1.0,
            );
            final fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        );
      case list:
        {
          final args = sett.arguments as ListPageModel;
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ListPage(
              type: args.type,
              category: args.category,
              title: args.title,
              subtitle: args.subtitle,
              image: args.image,
            ),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset(0.0, 0.0);
              const curve = Curves.ease;
              final tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              final slideAnimation = animation.drive(tween);

              return SlideTransition(
                position: slideAnimation,
                child: child,
              );
            },
          );
        }
      case landing:
        return MaterialPageRoute(builder: (_) => const Landing());
      case settings:
        return MaterialPageRoute(builder: (_) => Settings());
      case init:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const InitPage(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: 0.0,
              end: 1.0,
            );
            final fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        );
      default:
        throw const FormatException('Route nicht gefunden');
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
