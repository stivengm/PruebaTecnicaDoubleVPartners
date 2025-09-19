import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/config/providers/bloc_provider.dart';
import 'package:prueba_tecnica_doublevpartners/core/config/routes/app_routes';
import 'package:prueba_tecnica_doublevpartners/ui/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: mateApp()
    );
  }

  Widget mateApp() =>  MaterialApp(
    title: 'Prueba Técnica DoubleVPartners',
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.backgroundColorApp,
        brightness: Brightness.dark
      ),
      scaffoldBackgroundColor: AppColors.backgroundColorApp
    ),
    routes: appRoutes(),
    initialRoute: 'register_view',
  );
}
