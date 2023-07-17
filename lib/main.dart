import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:ess_mobile/splash_screen.dart';
import 'package:ess_mobile/providers/auth_provider.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => AuthProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
