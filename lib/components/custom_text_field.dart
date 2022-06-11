import 'package:flutter/material.dart';
class CustomTextFiled extends StatelessWidget {
  final dynamic filedName;
  final String? labelAndHint;
  final String? keyboardType;
  final Icon? suffix;
  final dynamic saved;
  const CustomTextFiled({Key? key,this.filedName,this.labelAndHint,this.keyboardType,this.suffix,this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType == 'number' ?TextInputType.number:null,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: labelAndHint,
        labelText: labelAndHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      onSaved: saved,
      validator: (value){
        if(value!.isEmpty){
          return "This field is required.";
        }else{
          return null;
        }
      },
    );
  }
}
