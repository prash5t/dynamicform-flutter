import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/core/model/option_to_select_model.dart';
import 'package:dynamicform/presentation/widgets/field_title_and_is_req_widget.dart';
import 'package:flutter/material.dart';

class DynamicDropDownWidget extends StatelessWidget {
  final DynamicFieldModel fieldModel;
  const DynamicDropDownWidget({super.key, required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    List<DynamicOptionToSelectModel> optionsToSelect =
        fieldModel.optionsToSelect ?? [];
    // initially choosing first value of options as field's value
    fieldModel.value = optionsToSelect[0].submitValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitleAndIsReqWidget(fieldData: fieldModel),
        8.toHGap(),
        DropdownButtonFormField<String>(
            items: optionsToSelect.map((DynamicOptionToSelectModel option) {
              return DropdownMenuItem<String>(
                value: option.submitValue,
                child: Text(option.displayValue!),
              );
            }).toList(),
            value: optionsToSelect[0].submitValue,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            onChanged: (pickedOption) {
              if (pickedOption != null) {
                fieldModel.value = pickedOption;
              }
            }),
      ],
    );
  }
}
