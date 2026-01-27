import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/routes/app_routes.dart';
import 'package:resumebuilder/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Resume Builder',
      initialRoute: URoutes.splash,
      getPages: UAppRoutes.screens,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
      darkTheme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
      themeMode: ThemeMode.system,
    );
  }
}
