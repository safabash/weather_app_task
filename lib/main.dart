import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/dashboard/dashboard_controller.dart';
import 'package:weather_app/screens/splash/splash.dart';
import 'package:weather_app/screens/splash/splash_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderSplash>(create: (_) => ProviderSplash()),
    ChangeNotifierProvider<DashBoardController>(
        create: (_) => DashBoardController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}
