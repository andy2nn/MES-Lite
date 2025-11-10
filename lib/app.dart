import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mes_lite/core/navigation/app_navigations.dart';
import 'package:mes_lite/core/theme/app_theme.dart';
import 'package:mes_lite/core/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        return MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          routes: AppNavigations.routes,
          initialRoute: AppNavigations.themeDemoPage,
        );
      },
    );
  }
}
