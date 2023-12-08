import 'package:dynamicform/core/enums/form_field_enum.dart';
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

  FormFieldEnums getDynamicFormFieldType() {
    switch (this) {
      case 'text':
        return FormFieldEnums.text;
      case 'dropdown':
        return FormFieldEnums.dropdown;
      case 'radio':
        return FormFieldEnums.radio;
      case 'date':
        return FormFieldEnums.date;
      default:
        return FormFieldEnums.text;
    }
  }
}
