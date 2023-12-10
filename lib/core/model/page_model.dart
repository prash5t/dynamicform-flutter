import 'package:dynamicform/core/model/field_model.dart';

class DynamicPageModel {
  String? pageTitle;
  List<DynamicFieldModel>? fields;

  DynamicPageModel({
    this.pageTitle,
    this.fields,
  });

  static const String kPageTitle = "title";
  static const String kFields = "fields";

  DynamicPageModel.fromJson(Map<String, dynamic> json) {
    pageTitle = json[kPageTitle];

    // deserializing fields of the page
    if (json[kFields] is List<Map<String, dynamic>>) {
      fields = [];
      for (Map<String, dynamic> fieldJSON in json[kFields]) {
        fields?.add(DynamicFieldModel.fromJson(fieldJSON));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    for (DynamicFieldModel field in fields ?? []) {
      data[field.key!] = field.value;
    }
    return data;
  }
}
