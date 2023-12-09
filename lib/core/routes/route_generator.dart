import 'package:dynamicform/core/model/form_model.dart';
import 'package:dynamicform/core/routes/app_routes.dart';
import 'package:dynamicform/presentation/screens/form_screen.dart';
import 'package:dynamicform/presentation/screens/home_screen.dart';
import 'package:dynamicform/presentation/screens/view_form_data_screen.dart';
import 'package:dynamicform/presentation/screens/view_json_that_builds_dynamic_form_screen.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  Object? argument = settings.arguments;
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return CupertinoPageRoute(builder: (context) => const HomeScreen());
    case AppRoutes.addFormDataScreen:
      return CupertinoPageRoute(
          builder: (context) =>
              DynamicFormScreen(formModel: argument as DynamicFormModel));
    case AppRoutes.viewFormDataScreen:
      return CupertinoPageRoute(
          builder: (context) => const ViewFormDataScreen());
    case AppRoutes.viewJsonThatBuildsDynamicFormScreen:
      return CupertinoPageRoute(
          builder: (context) => const ViewJsonThatBuildsDynamicFormScreen());
    default:
      return CupertinoPageRoute(builder: (context) => const HomeScreen());
  }
}
