import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weather_application/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: "Weather_App",
      debugShowCheckedModeBanner: false,
    );
  }
}
