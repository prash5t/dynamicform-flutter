import 'package:dynamicform/core/model/field_model.dart';
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
    }
  }

  @override
  void initState() {
    dateInputController.text = _getMMddyyyyDateInString(
        widget.fieldModel.validationRule?.endData ?? DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DynamicFieldModel fieldModel = widget.fieldModel;
    return InkWell(
      onTap: () => _pickDOBFromCalender(),
      child: TextFormField(
        controller: dateInputController,
        readOnly: true,
        decoration: InputDecoration(
            labelText: fieldModel.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
