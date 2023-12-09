import 'package:dynamicform/core/enums/form_field_type_enum.dart';
import 'package:flutter/material.dart';

extension StringExtensions on String {
  TextInputType getDynamicKeyboardType() {
    switch (this) {
      case 'phone':
        return TextInputType.phone;
      case 'email':
        return TextInputType.emailAddress;
      case 'password':
        return TextInputType.visiblePassword;
      case 'multiline':
        return TextInputType.multiline;
      case 'url':
        return TextInputType.url;
      case 'number':
        return TextInputType.number;
      case 'name':
        return TextInputType.name;
      case 'address':
        return TextInputType.streetAddress;
      case '':
      default:
        return TextInputType.text;
    }
  }

  FormFieldTypeEnums getDynamicFormFieldType() {
    switch (this) {
      case 'text':
        return FormFieldTypeEnums.text;
      case 'dropdown':
        return FormFieldTypeEnums.dropdown;
      case 'radio':
        return FormFieldTypeEnums.radio;
      case 'date':
        return FormFieldTypeEnums.date;
      default:
        return FormFieldTypeEnums.text;
    }
  }
}
