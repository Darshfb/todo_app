import 'package:flutter/material.dart';

class defaultTextFormField extends StatelessWidget {
  ValueChanged<String>? onChange;
  FormFieldValidator<String>? validator;
  String? hintText;
  String? labelText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Function()? suffixPressed;
  GestureTapCallback? onTap;
  bool? isDense;
  Function(String)? onSubmit;
  TextInputType? textInputType;
  TextEditingController? controller;

  defaultTextFormField({
    this.hintText,
    this.onChange,
    this.onSubmit,
    this.controller,
    this.validator,
    this.labelText,
    this.onTap,
    this.prefixIcon,
    this.suffixPressed,
    this.suffixIcon,
    this.textInputType,
    this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChange,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon)),
        isDense: isDense,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
