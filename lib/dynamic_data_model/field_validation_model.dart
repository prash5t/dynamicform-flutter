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

  /// Constructs a [DynamicFieldValidationModel].
  DynamicFieldValidationModel(
      {this.isRequired,
      this.pattern,
      this.minLength,
      this.maxLength,
      this.startDate,
      this.endData});

  static const String kRequired = "required";
  static const String kPattern = "pattern";
  static const String kMinLength = "minLength";
  static const String kMaxLength = "maxLength";
  static const String kStartDate = "startDate";
  static const String kEndDate = "endDate";

  DynamicFieldValidationModel.fromJson(Map<String, dynamic> json) {
    isRequired = json[kRequired];
    pattern = json[kPattern];
    minLength = json[kMinLength];
    maxLength = json[kMaxLength];
    startDate = DateTime.tryParse(kStartDate);
    endData = DateTime.tryParse(kEndDate);
  }
}
