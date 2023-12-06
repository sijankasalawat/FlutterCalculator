import 'package:calculator/routes/app_route.dart';
import 'package:calculator/theme/theme_dark.dart';
import 'package:calculator/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen',
      theme: ThemeData.from(
        textTheme: GoogleFonts.blackOpsOneTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: lightTheme.colorScheme,
        // Add other properties from lightTheme as needed
      ),
      darkTheme: ThemeData.from(
        textTheme: GoogleFonts.blackOpsOneTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: darkTheme.colorScheme,
        // Add other properties from darkTheme as needed
      ),
      initialRoute: AppRoute.calculatorRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
