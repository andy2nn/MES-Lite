import 'package:flutter/material.dart';
import 'package:mes_lite/features/first/presentation/pages/theme_demo_page.dart';
import 'package:mes_lite/features/sec/sec_page.dart';
import 'package:mes_lite/features/auth/presentation/pages/auth_page.dart';

class AppNavigations {
  static const String themeDemoPage = "themeDemo";
  static const String secPage = "secPage";
  static const String auth = "auth";

  static Map<String, Widget Function(BuildContext)> routes = {
    auth: (context) => const AuthPage(),
    themeDemoPage: (context) => const ThemeDemoPage(),
    secPage: (context) => const SecPage(),
  };
}
