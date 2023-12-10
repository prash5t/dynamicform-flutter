import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/presentation/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class FieldTitleAndIsReqWidget extends StatelessWidget {
  final DynamicFieldModel fieldData;
  const FieldTitleAndIsReqWidget({super.key, required this.fieldData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: fieldData.label ?? ""),
        5.toWGap(),
        if (fieldData.validationRule?.isRequired ?? false)
          const CustomText(
            text: "*",
            textColor: Colors.red,
          )
      ],
    );
  }
}
