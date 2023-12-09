import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/core/model/option_to_select_model.dart';
import 'package:flutter/material.dart';

class DynamicDropDownWidget extends StatelessWidget {
  final DynamicFieldModel fieldModel;
  const DynamicDropDownWidget({super.key, required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    List<DynamicOptionToSelectModel> optionsToSelect =
        fieldModel.optionsToSelect ?? [];
    return Column(
      children: [
        Text(fieldModel.label ?? ""),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
            items: optionsToSelect.map((DynamicOptionToSelectModel option) {
              return DropdownMenuItem<String>(
                value: option.submitValue,
                child: Text(option.displayValue!),
              );
            }).toList(),
            onChanged: (pickedOption) {}),
      ],
    );
  }
}
