import 'package:flutter/material.dart';

extension StringExtensions on String {
  TextInputType getKeyboardType() {
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
}
