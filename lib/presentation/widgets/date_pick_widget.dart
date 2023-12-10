import 'package:dynamicform/core/extensions/num_extensions.dart';
import 'package:dynamicform/core/model/field_model.dart';
import 'package:dynamicform/presentation/widgets/field_title_and_is_req_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDatePickWidget extends StatefulWidget {
  final DynamicFieldModel fieldModel;
  const DynamicDatePickWidget({super.key, required this.fieldModel});

  @override
  State<DynamicDatePickWidget> createState() => _DynamicDatePickWidgetState();
}

class _DynamicDatePickWidgetState extends State<DynamicDatePickWidget> {
  TextEditingController dateInputController = TextEditingController();

  String _getMMddyyyyDateInString(DateTime dateTime) =>
      DateFormat('MM/dd/yyyy').format(dateTime);

  void _pickDOBFromCalender() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.fieldModel.validationRule?.endData ?? DateTime.now(),
      firstDate: widget.fieldModel.validationRule?.startDate ?? DateTime(1950),
      lastDate: widget.fieldModel.validationRule?.endData ?? DateTime.now(),
    );
    if (pickedDate != null) {
      dateInputController.text = _getMMddyyyyDateInString(pickedDate);
      widget.fieldModel.value = pickedDate.toUtc().toIso8601String();
    }
  }

  @override
  void initState() {
    dateInputController.text = _getMMddyyyyDateInString(
        widget.fieldModel.validationRule?.endData ?? DateTime.now());
    widget.fieldModel.value =
        (widget.fieldModel.validationRule?.endData ?? DateTime.now())
            .toUtc()
            .toIso8601String();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DynamicFieldModel fieldModel = widget.fieldModel;
    return InkWell(
      onTap: () => _pickDOBFromCalender(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldTitleAndIsReqWidget(fieldData: fieldModel),
          8.toHGap(),
          TextFormField(
            onTap: () => _pickDOBFromCalender(),
            controller: dateInputController,
            readOnly: true,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ],
      ),
    );
  }
}
