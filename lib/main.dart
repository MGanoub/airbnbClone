import 'package:airbnb_clone/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import "package:airbnb_clone/shared/theme/colors.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: appRed),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
