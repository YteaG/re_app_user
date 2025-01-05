import 'package:flutter/material.dart';
import 'package:rm_app/core/themes/themes_data.dart';
import 'package:rm_app/features/home/presentation/screens/main.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: AppTheme.themeData,
      // initialBinding: AppBindings()
      // initialRoute: '/',
      // routes: AppRoutes.routes,
    );
  }
}
