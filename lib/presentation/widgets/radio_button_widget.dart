import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/presentation/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class DynamicRadioButtonWidget extends StatelessWidget {
  final DynamicFieldModel fieldModel;
  const DynamicRadioButtonWidget({super.key, required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectedRadioValue =
        ValueNotifier<String>(fieldModel.optionsToSelect![0].submitValue!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: fieldModel.label ?? ""),
        8.toHGap(),
        ValueListenableBuilder(
          valueListenable: selectedRadioValue,
          builder: (context, newRadioVal, child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: fieldModel.optionsToSelect?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => selectedRadioValue.value =
                      fieldModel.optionsToSelect![index].submitValue!,
                  child: Row(
                    children: [
                      Radio<String>(
                          value:
                              fieldModel.optionsToSelect![index].submitValue!,
                          groupValue: newRadioVal,
                          onChanged: (pickedOption) {
                            if (pickedOption != null) {
                              selectedRadioValue.value = pickedOption;
                            }
                          }),
                      Text(
                          fieldModel.optionsToSelect?[index].displayValue ?? "")
                    ],
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
