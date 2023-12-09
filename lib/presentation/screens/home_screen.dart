import 'package:dynamicform/core/model/form_model.dart';
import 'package:dynamicform/core/routes/app_routes.dart';
import 'package:dynamicform/mock_data/dynamic_form_mock_data.dart';
import 'package:dynamicform/presentation/widgets/home_screen_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeScreenButtonWidget(
            title: "Fill dynamic form",
            route: AppRoutes.addFormDataScreen,
            dataToInject: DynamicFormModel.fromJson(dynamicFormMockData),
          ),
          const HomeScreenButtonWidget(
              title: "View filled data", route: AppRoutes.viewFormDataScreen),
          const HomeScreenButtonWidget(
            title: "View JSON that is used to build dynamic form",
            route: AppRoutes.viewJsonThatBuildsDynamicFormScreen,
          ),
        ],
      ),
    );
  }
}
