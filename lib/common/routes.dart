import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/feature/home/home.dart';
import 'package:flutter_sample/feature/lectors/lectors.dart';
import 'package:flutter_sample/feature/lesson/lesson.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      // RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      // RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      // RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      //RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
      RouteEntity(path: AppRoutesNames.LECTORS, page: const Lectors()),
      RouteEntity(path: AppRoutesNames.LESSON, page: const Lesson()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route is ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (context) => const Home(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}

class AppRoutesNames {
  // static const String WELCOME = "/";
  // static const String SIGN_IN = "/sign_in";
  // static const String REGISTER = "/register";
  //static const String APPLICATION = "/application";
  static const String HOME = "/home";
  static const String LECTORS = "/lectors";
  static const String LESSON = "/lesson";
}
