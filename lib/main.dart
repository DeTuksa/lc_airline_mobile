import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lc_airline/core/presentation/routes/app_pages.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';
import 'package:lc_airline/features/auth/domain/auth_cubit.dart';
import 'package:lc_airline/features/booking/domain/booking_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<BookingCubit>(create: (_) => BookingCubit()),
          BlocProvider<AuthCubit>(create: (_) => AuthCubit())
        ],
        child: const MyApp(),
      )
  );
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
