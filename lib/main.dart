import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mes_lite/app.dart';
import 'package:mes_lite/core/di/injaction.dart';
import 'package:mes_lite/core/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.setup();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => Injection.getIt.get<ThemeCubit>(),
    )
  ], child: const App()));
}
