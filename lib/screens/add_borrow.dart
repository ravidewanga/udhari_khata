import 'package:flutter/material.dart';
import 'package:flutter_game/components/button.dart';
import 'package:flutter_game/components/custom_text_field.dart';
import 'package:flutter_game/components/date_time_picker.dart';
class AddBorrow extends StatefulWidget {
  const AddBorrow({Key? key}) : super(key: key);

  @override
  State<AddBorrow> createState() => _AddBorrowState();
}

class _AddBorrowState extends State<AddBorrow> {
  final _formKey = GlobalKey<FormState>();

  dynamic personName;
  dynamic amount;
  dynamic interstate;
  dynamic returnDate;

  submit(){
    if (!_formKey.currentState!.validate()) {
      return;
    }else{
      _formKey.currentState!.save();
      print('$personName $amount $interstate $returnDate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Borrow'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFiled(
                filedName: personName,
                labelAndHint: 'Person Name',
                suffix: const Icon(Icons.person),
                saved:(value) => personName = value,
              ),
              const SizedBox(height: 10),
              CustomTextFiled(
                filedName: amount,
                labelAndHint: 'Amount',
                keyboardType: 'number',
                suffix: const Icon(Icons.currency_rupee),
                saved:(value) => amount = value,
              ),
              const SizedBox(height: 10),
              CustomTextFiled(
                filedName: interstate,
                labelAndHint: 'Interest',
                keyboardType: 'number',
                suffix: const Icon(Icons.percent_outlined),
                saved:(value) => interstate = value,
              ),
              const SizedBox(height: 10),
              DateTimePicker(
                filedName: returnDate,
                labelAndHint: 'Return Date',
                suffix: const Icon(Icons.calendar_today_outlined),
                saved:(value) => returnDate = value,
              ),
              const SizedBox(height: 10),
              Button(onPressed: submit,buttonName: 'Submit',horizontal: 50.0,vertical: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}
