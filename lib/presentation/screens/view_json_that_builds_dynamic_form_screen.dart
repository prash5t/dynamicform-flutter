import 'package:dynamicform/mock_data/dynamic_form_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

class ViewJsonThatBuildsDynamicFormScreen extends StatelessWidget {
  const ViewJsonThatBuildsDynamicFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: JsonView.map(
      dynamicFormMockData,
      theme: const JsonViewTheme(backgroundColor: Colors.transparent),
    )));
  }
}
