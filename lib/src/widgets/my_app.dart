import 'package:flutter/material.dart';
// import '../screens/home.dart';
import '../routers/routers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistence App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF007A33),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFF8FAF6),
      ),
      routes: getAplicationRouter(),
    );
  }
}
