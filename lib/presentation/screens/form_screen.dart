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
  PageController pageController = PageController();
  List<GlobalKey<FormState>> pageFormKeys = [];
  ValueNotifier<int> pageAt = ValueNotifier<int>(0);

  bool isAtLastPage({required int pageAt}) =>
      pageAt == widget.formModel.pages!.length - 1;

  @override
  void initState() {
    for (int i = 0; i < widget.formModel.pages!.length; i++) {
      pageFormKeys.add(GlobalKey<FormState>());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DynamicFormModel formModel = widget.formModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildNextFinishButton(formModel),
        body: PageView.builder(
          controller: pageController,
          itemCount: formModel.pages?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Form(
              key: pageFormKeys[index],
              child:
                  DynamicPageWidget(pageFieldsData: formModel.pages![index])),
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
                  onPressed: () {
                    if (pageFormKeys[pageIndex].currentState!.validate()) {
                      debugPrint("page validated");
                      if (isAtLastPage(pageAt: pageIndex)) {
                        debugPrint("page validated and at last page");
                      } else {
                        goNextPage();
                      }
                    }
                  },
                  child: Text(
                      isAtLastPage(pageAt: pageIndex) ? "Finish" : "Next")))),
    );
  }

  void goNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
