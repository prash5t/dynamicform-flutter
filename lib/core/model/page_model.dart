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

  // deserializing fields of the page
  DynamicPageModel.fromJson(Map<String, dynamic> json) {
    pageTitle = json[kPageTitle];
    if (json[kFields] is List<Map<String, dynamic>>) {
      fields = [];
      for (Map<String, dynamic> fieldJSON in json[kFields]) {
        fields?.add(DynamicFieldModel.fromJson(fieldJSON));
      }
    }
  }
}
