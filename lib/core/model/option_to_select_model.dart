/// Represents options for fields used in dropdown and radio button widgets.
class DynamicOptionToSelectModel {
  /// What is displayed to the user.
  String? displayValue;

  /// The actual value used for selection and submission.
  String? submitValue;

  /// Constructs a [DynamicOptionToSelectModel].
  DynamicOptionToSelectModel({
    this.displayValue,
    this.submitValue,
  });

  static const String kDisplay = "display";
  static const String kValue = "value";

  DynamicOptionToSelectModel.fromJson(Map<String, dynamic> json) {
    displayValue = json[kDisplay];
    submitValue = json[kValue];
  }
}
