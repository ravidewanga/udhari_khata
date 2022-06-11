import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class DateTimePicker extends StatelessWidget {
  final dynamic filedName;
  final String? labelAndHint;
  final String? keyboardType;
  final Icon? suffix;
  final dynamic saved;
  const DateTimePicker({Key? key,this.filedName,this.labelAndHint,this.keyboardType,this.suffix,this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    return DateTimeField(
      format: format,
      decoration: const InputDecoration(
        //suffixIcon: suffix,
        hintText: 'Return Date',
        labelText: 'Return Date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
      onSaved:saved,
      validator: (value){
        if(value == null){
          return "This field is required.";
        }else{
          return null;
        }
      },
    );
  }
}
