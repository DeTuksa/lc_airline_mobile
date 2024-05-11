import 'package:flutter/material.dart';
import 'package:lc_airline/core/presentation/routes/app_pages.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LC Airline',
      theme: AppTheme.lightTheme,
      routerConfig: AppPages.routes,
    );
  }
}
