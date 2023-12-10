import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/presentation/widgets/field_title_and_is_req_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicTextFormField extends StatelessWidget {
  final DynamicFieldModel fieldData;
  const DynamicTextFormField({super.key, required this.fieldData});

  @override
  Widget build(BuildContext context) {
    String? allowRegex = fieldData.validationRule?.pattern;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitleAndIsReqWidget(fieldData: fieldData),
        8.toHGap(),
        TextFormField(
          validator: (value) =>
              fieldData.validationRule?.fieldLengthValidator(value),
          onChanged: (value) {
            fieldData.value = value.trim();
          },
          keyboardType: fieldData.validationRule?.inputType,
          // maxLength: fieldData.validationRule?.maxLength,
          inputFormatters: (allowRegex != null && allowRegex.trim() != "")
              ? [FilteringTextInputFormatter.allow(RegExp(allowRegex))]
              : null,
          decoration: InputDecoration(
              hintText: "Input field",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }
}
