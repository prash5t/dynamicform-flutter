import 'package:dynamicform/core/routes/app_routes.dart';
import 'package:dynamicform/core/routes/route_generator.dart';
import 'package:flutter/material.dart';

class DynamicFormApp extends StatelessWidget {
  const DynamicFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
