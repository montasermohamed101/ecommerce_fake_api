import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
   TextEditingController controller = TextEditingController();
    bool? obscureText;
    Function validator;
   Widget prefixIcon;
   Widget? suffixIcon;
   String hintText;
   TextInputType inputType;

   AuthTextFormField({
     required this.controller,
     this.obscureText,
     required this.validator,
     required this.prefixIcon,
     this.suffixIcon,
     required this.hintText,
     required this.inputType,
   }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      cursorColor: Colors.black,
      keyboardType: inputType,
      validator: (value)=> validator(value),
      decoration: InputDecoration(
        // fillColor: Colors.grey.shade700,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
