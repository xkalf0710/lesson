

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lesson/utils/theme.dart';

class FormTextField extends StatefulWidget {

  final dynamic inputFormatter;
  final dynamic validator;
  final dynamic keyboardType;
  final dynamic controller;
  final String hintText;

  const FormTextField({
    super.key,
    this.controller,
    this.inputFormatter,
    this.validator, this.keyboardType = TextInputType.text,
    this.hintText = "",
});

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(name: 'email',
    controller: widget.controller,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: const TextStyle(color: colorSecondary),
      textAlign: TextAlign.start,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 17.0),
        hintStyle: const TextStyle(fontSize: 16,
        color: Colors.grey,
        ),
        hintText: widget.hintText,
        errorStyle: const TextStyle(fontSize: 14, color: Colors.grey,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: const BorderSide(
            color: colorPrimary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 100,
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide(
            color: colorPrimary,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: const BorderSide(
            color: colorPrimary,
            width: 1,
          ),
        ),
      ),
    );
  }
}
