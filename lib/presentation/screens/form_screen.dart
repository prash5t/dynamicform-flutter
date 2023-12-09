import 'package:dynamicform/core/model/form_model.dart';
import 'package:dynamicform/presentation/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class DynamicFormScreen extends StatefulWidget {
  final DynamicFormModel formModel;
  const DynamicFormScreen({super.key, required this.formModel});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  ValueNotifier<int> pageAt = ValueNotifier<int>(0);

  bool isAtLastPage({required int pageAt, required int totalPages}) =>
      pageAt == widget.formModel.pages!.length - 1;

  @override
  Widget build(BuildContext context) {
    DynamicFormModel formModel = widget.formModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildNextFinishButton(formModel),
        body: PageView.builder(
          itemCount: formModel.pages?.length ?? 0,
          itemBuilder: (context, index) =>
              DynamicPageWidget(pageFieldsData: formModel.pages![index]),
          onPageChanged: (newPageIndex) {
            pageAt.value = newPageIndex;
          },
        ),
      ),
    );
  }

  Padding _buildNextFinishButton(DynamicFormModel formModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ValueListenableBuilder(
              valueListenable: pageAt,
              builder: (context, pageIndex, child) => ElevatedButton(
                  onPressed: () {},
                  child: Text(isAtLastPage(
                          pageAt: pageIndex,
                          totalPages: formModel.pages?.length ?? 0)
                      ? "Finish"
                      : "Next")))),
    );
  }
}
