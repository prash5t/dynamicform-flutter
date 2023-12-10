import 'package:dynamicform/core/model/form_model.dart';
import 'package:dynamicform/core/routes/app_routes.dart';
import 'package:dynamicform/presentation/screens/view_form_data_screen.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ValueListenableBuilder(
          valueListenable: pageAt,
          builder: (context, pageIndex, child) => Row(
                children: [
                  if (pageIndex != 0)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => goPreviousPage(),
                              child: const Text("Back")),
                        ),
                      ),
                    ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (pageFormKeys[pageIndex]
                                .currentState!
                                .validate()) {
                              Map<String, dynamic> thisPageFilledData =
                                  formModel.pages![pageIndex].toJson();
                              debugPrint(
                                  "page filled data: $thisPageFilledData");
                              for (var field in thisPageFilledData.entries) {
                                ViewFormDataScreen
                                        .dynamicFormFilledValues[field.key] =
                                    field.value;
                              }

                              // store the filled values in
                              if (isAtLastPage(pageAt: pageIndex)) {
                                debugPrint("page validated and at last page");
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoutes.homeScreen, (route) => false);
                              } else {
                                goNextPage();
                              }
                            }
                          },
                          child: Text(isAtLastPage(pageAt: pageIndex)
                              ? "Finish"
                              : "Next")),
                    ),
                  ),
                ],
              )),
    );
  }

  void goNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void goPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
