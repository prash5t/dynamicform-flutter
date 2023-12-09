import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/page_model.dart';
import 'package:dynamicform/presentation/widgets/custom_text_widget.dart';
import 'package:dynamicform/presentation/widgets/dynamic_field_widget.dart';
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
            CustomText(
              text: pageFieldsData.pageTitle ?? "Page Title",
              isBold: true,
              size: 18,
            ),
            20.toHGap(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: pageFieldsData.fields?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DynamicFieldWidget(
                      fieldData: pageFieldsData.fields![index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
