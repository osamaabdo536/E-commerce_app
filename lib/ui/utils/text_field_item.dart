import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/utils/app_theme.dart';
import '';

class TextFieldItem extends StatelessWidget {
  String label;
  String hintText;
  Widget? suffixIcon;
  var keyboardType;
  bool isObscure;
  TextEditingController controller;
  String? Function(String?) validator;
  TextFieldItem(
      {required this.label,
      required this.hintText,
      this.suffixIcon,
      this.keyboardType = TextInputType.text,
      this.isObscure = false,
      required this.controller,
      required this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: MyTheme.white,
            label: Text(
              label,
              style: TextStyle(color: MyTheme.white),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: MyTheme.white, width: 2))),
        keyboardType: keyboardType,
        obscureText: isObscure,
        validator: validator,
      ),
    );
  }
}
