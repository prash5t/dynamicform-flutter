import 'package:dynamicform/core/enums/form_field_type_enum.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/presentation/widgets/date_pick_widget.dart';
import 'package:dynamicform/presentation/widgets/dropdown_widget.dart';
import 'package:dynamicform/presentation/widgets/radio_button_widget.dart';
import 'package:dynamicform/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class DynamicFieldWidget extends StatelessWidget {
  final DynamicFieldModel fieldData;
  const DynamicFieldWidget({super.key, required this.fieldData});

  @override
  Widget build(BuildContext context) {
    switch (fieldData.type ?? FormFieldTypeEnums) {
      case FormFieldTypeEnums.text:
        return DynamicTextFormField(fieldData: fieldData);

      case FormFieldTypeEnums.dropdown:
        return DynamicDropDownWidget(fieldModel: fieldData);

      case FormFieldTypeEnums.radio:
        return DynamicRadioButtonWidget(fieldModel: fieldData);

      case FormFieldTypeEnums.date:
        return DynamicDatePickWidget(fieldModel: fieldData);

      default:
        return DynamicTextFormField(fieldData: fieldData);
    }
  }
}
