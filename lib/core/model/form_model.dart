import 'package:dynamicform/core/model/page_model.dart';

class DynamicFormModel {
  List<DynamicPageModel>? pages;

  DynamicFormModel({this.pages});

  static const String kPages = "pages";

  DynamicFormModel.fromJson(Map<String, dynamic> json) {
    if (json[kPages] is List<Map<String, dynamic>>) {
      pages = [];
      for (Map<String, dynamic> pageJSON in json[kPages]) {
        pages?.add(DynamicPageModel.fromJson(pageJSON));
      }
    }
  }
}
