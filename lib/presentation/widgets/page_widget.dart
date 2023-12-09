import 'package:dynamicform/core/model/page_model.dart';
import 'package:flutter/material.dart';

class DynamicPageWidget extends StatelessWidget {
  final DynamicPageModel pageFieldsData;
  const DynamicPageWidget({super.key, required this.pageFieldsData});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Text(pageFieldsData.pageTitle ?? "Page Title"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pageFieldsData.fields?.length ?? 0,
              itemBuilder: (context, index) {},
            )
          ],
        ),
      ),
    );
  }
}
