import 'package:dynamicform/core/model/field_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicTextFormField extends StatelessWidget {
  final DynamicFieldModel fieldData;
  const DynamicTextFormField({super.key, required this.fieldData});

  @override
  Widget build(BuildContext context) {
    String? allowRegex = fieldData.validationRule?.pattern;
    return TextFormField(
      keyboardType: fieldData.validationRule?.inputType,
      maxLength: fieldData.validationRule?.maxLength,
      inputFormatters: (allowRegex != null && allowRegex.trim() != "")
          ? [FilteringTextInputFormatter.allow(RegExp(allowRegex))]
          : null,
      decoration: InputDecoration(
          labelText: fieldData.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
