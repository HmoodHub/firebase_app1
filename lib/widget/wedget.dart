// ignore_for_file: constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Widget textFormFieldApp(
    {required TextEditingController controller,
    required TextInputType type,
    bool? obscureText,
    String? hint,
    IconData? prefixIcon,
    Widget? prefixWidget,
    void Function(String)? onChanged,
    IconData? suffix,
    void Function()? onPressedSuffix,
    Color? color,
    bool filled = false,
    Color? textColor,
    double borderRedius = 45,
    double? width,
    double? height,
    Paint? paint,
    EdgeInsets? edgeInsets,
    FontWeight fontWeight = FontWeight.normal,
    Color? fillColor,
    Color? suffixColor,
    String? helperText,
    void Function(String)? onSubmit,
    Color? colorhint}) {
  return TextFormField(
    style: TextStyle(foreground: paint, fontWeight: fontWeight),
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'this field is required';
      }
    },
    onFieldSubmitted: onSubmit,
    keyboardType: type,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      contentPadding: edgeInsets,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRedius),
        borderSide: BorderSide(
          width: 1,
          color: color ?? Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRedius),
        borderSide: BorderSide(
          width: 1,
          color: color ?? Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRedius),
        borderSide: BorderSide(
          width: 1,
          color: color ?? Colors.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRedius),
        borderSide: BorderSide(
          width: 1,
          color: color ?? Colors.grey,
        ),
      ),
      hintText: hint,
      helperText: helperText,
      prefix: prefixWidget,
      hintStyle: TextStyle(color: colorhint ?? color),
      prefixIcon: Icon(prefixIcon, color: color),
      suffixIcon: IconButton(
        onPressed: onPressedSuffix,
        icon: Icon(
          suffix,
          color: suffixColor,
        ),
      ),
      fillColor: fillColor,
      filled: filled,
    ),
  );
}

void toastMessage({
  required String msg,
  int? gravity,
  required Color state,
}) {
  Toast.show(
   msg,
    gravity: gravity,
    backgroundColor: state,
  );
}




