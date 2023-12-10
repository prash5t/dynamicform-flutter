import 'package:dynamicform/presentation/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ViewFormDataScreen extends StatelessWidget {
  static Map<String, dynamic> dynamicFormFilledValues = {};
  const ViewFormDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, dynamic>> filledFields =
        dynamicFormFilledValues.entries.toList();
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Key", isBold: true),
                  CustomText(text: "Value", isBold: true)
                ],
              ),
              dynamicFormFilledValues.isEmpty
                  ? const CustomText(
                      text: "Empty, fill at least one page first")
                  : ListView.builder(
                      itemCount: dynamicFormFilledValues.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: filledFields[index].key.toString()),
                              CustomText(
                                  text: filledFields[index].value.toString())
                            ]);
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
