import 'package:dynamicform/core/model/field_model.dart';
import 'package:flutter/material.dart';

class DynamicRadioButtonWidget extends StatelessWidget {
  final DynamicFieldModel fieldModel;
  const DynamicRadioButtonWidget({super.key, required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectedRadioValue =
        ValueNotifier<String>(fieldModel.optionsToSelect![0].submitValue!);
    return Column(
      children: [
        Text(fieldModel.label ?? ""),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: fieldModel.optionsToSelect?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(fieldModel.label ?? ""),
              leading: Radio<String>(
                  value: fieldModel.optionsToSelect![index].submitValue!,
                  groupValue: selectedRadioValue.value,
                  onChanged: (pickedOption) {
                    if (pickedOption != null) {
                      selectedRadioValue.value = pickedOption;
                    }
                  }),
            );
          },
        )
      ],
    );
  }
}
