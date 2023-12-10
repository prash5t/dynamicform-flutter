import 'package:dynamicform/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

/// A model that encapsulates validation rules for a field.
class DynamicFieldValidationModel {
  /// Indicates whether the field is required.
  bool? isRequired;

  /// A regular expression pattern for the allowed input in the text field.
  String? pattern;

  /// The minimum length allowed for the text field.
  int? minLength;

  /// The maximum length allowed for the text field.
  int? maxLength;

  // For Date field where user picks date from calender
  /// Start date for the calender
  DateTime? startDate;

  /// End date for the calender
  DateTime? endData;

  /// Text input type: Usable for text form field
  TextInputType? inputType;

  /// Constructs a [DynamicFieldValidationModel].
  DynamicFieldValidationModel({
    this.isRequired,
    this.pattern,
    this.minLength,
    this.maxLength,
    this.startDate,
    this.endData,
    this.inputType,
  });

  static const String kRequired = "required";
  static const String kPattern = "pattern";
  static const String kMinLength = "minLength";
  static const String kMaxLength = "maxLength";
  static const String kStartDate = "startDate";
  static const String kEndDate = "endDate";
  static const String kInputType = "inputType";

  DynamicFieldValidationModel.fromJson(Map<String, dynamic> json) {
    isRequired = json[kRequired];
    pattern = json[kPattern];
    minLength = json[kMinLength];
    maxLength = json[kMaxLength];

    if (json[kStartDate] != null) {
      startDate = DateTime.tryParse(json[kStartDate]);
    }

    if (json[kEndDate] != null) {
      endData = DateTime.tryParse(json[kEndDate]);
    }
    if (json[kInputType] is String) {
      String keyboardType = json[kInputType] as String;
      inputType = keyboardType.getDynamicKeyboardType();
    }
  }

  fieldLengthValidator(value) {
    if (isRequired ?? false) {
      if (minLength != null && value.length < minLength) {
        return "Min length: $minLength";
      } else if (maxLength != null && value.length > maxLength) {
        return "Max length: $maxLength";
      }
      return null;
    }
    return null;
  }
}
