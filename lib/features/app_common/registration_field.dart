import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/default_padding.dart';


class InputField extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  TextInputType? inputType;
  final bool disablePadding;
  final Widget? suffixIcon;

  InputField(
      {required this.title,
      required this.hint,
      required this.controller,
      this.inputType,
      this.formKey,
      this.validator,
      this.disablePadding = false,
      this.suffixIcon,
      super.key});

  static final FocusNode myFocusNode = FocusNode();

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  void dispose() {
    super.dispose();
    widget.controller.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: widget.disablePadding ? EdgeInsets.zero : defaultPadding,
      child: Column(
        children: [
          formField(),
        ],
      ),
    );
  }

  Widget formField(){
    Color unFocusedColor = AppColors.textFieldUnFocusedColor;
    Color focusedColor = AppColors.textFieldFocusedColor;

    return Form(
      key: widget.formKey,

      child: TextFormField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        validator: widget.validator,

        //style
        style:
        const TextStyle(fontSize: 18, fontFamily: 'urbanist'),
        decoration: InputDecoration(

          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),

          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: widget.suffixIcon),

          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(width: 1,color: focusedColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: unFocusedColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(width: 1,color: unFocusedColor),
          ),
          filled: false,
          hintStyle: TextStyle(color: unFocusedColor, fontFamily: 'urbanist', fontSize: 16),
          hintText: widget.hint,
          label: Text(widget.title,),
          labelStyle: TextStyle(
              color: focusedColor, fontFamily: 'urbanist'
          ),

        ),
      ),
    );
  }
}
