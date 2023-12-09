import 'package:dynamicform/core/enums/form_field_type_enum.dart';
import 'package:dynamicform/core/extensions/string_extensions.dart';
import 'package:dynamicform/core/model/field_validation_model.dart';
import 'package:dynamicform/core/model/option_to_select_model.dart';

class DynamicFieldModel {
  String? key;
  String? value;
  FormFieldTypeEnums? type;
  String? label;
  List<DynamicOptionToSelectModel>? optionsToSelect;
  DynamicFieldValidationModel? validationRule;

  DynamicFieldModel({
    this.key,
    this.type,
    this.label,
    this.optionsToSelect,
    this.validationRule,
    this.value,
  });

  static const String kKey = "key";
  static const String kType = "type";
  static const String kLabel = "label";
  static const String kOptionsToSelect = "options";
  static const String kValidationRule = "validation";

  DynamicFieldModel.fromJson(Map<String, dynamic> json) {
    key = json[kKey];

    // deserealizing type
    if (json[kType] is String) {
      String fieldType = json[kType] as String;
      type = fieldType.getDynamicFormFieldType();
    }
    label = json[kLabel];

    // deserealizing options to select
    if (json[kOptionsToSelect] is List<Map<String, String>>) {
      List<Map<String, String>> optionsList =
          json[kOptionsToSelect] as List<Map<String, String>>;
      optionsToSelect = [];
      for (Map<String, dynamic> optionJSON in optionsList) {
        optionsToSelect?.add(DynamicOptionToSelectModel.fromJson(optionJSON));
      }
    }

    // deserealizing validation rules field
    if (json[kValidationRule] is Map<String, dynamic>) {
      validationRule =
          DynamicFieldValidationModel.fromJson(json[kValidationRule]);
    }
  }
}
