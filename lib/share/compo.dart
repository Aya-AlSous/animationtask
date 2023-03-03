import 'package:flutter/material.dart';

Widget MyTextFormField({
  required String labelText,
  required IconData prefixIcon,
  bool? obscureText,
  required TextInputType keyboardType,
  required MaterialColor color,
  IconData? suffixIcon,
  required OutlineInputBorder border,
  required String? Function(dynamic value) validator,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(20),
        )),
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.purple,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcon))
            : null,
      ),
    ),
  );
}
