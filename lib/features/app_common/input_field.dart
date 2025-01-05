import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/default_padding.dart';


class InputField extends StatefulWidget {
  final String? title;
  final String hint;
  final TextEditingController controller;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  TextInputType? inputType;
  final bool disablePadding;
  final bool filled;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onFieldFocused;
  final void Function()? onFieldUnfocused;

  InputField(
      {
      this.title,
      required this.hint,
      required this.controller,
      this.inputType,
      this.formKey,
      this.validator,
      this.disablePadding = false,
      this.filled = false,
      this.prefixIcon,
      this.onChanged,
      this.onFieldSubmitted,
      this.onFieldFocused,
      this.onFieldUnfocused,
      super.key});

  static final FocusNode myFocusNode = FocusNode();

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Add a listener to the FocusNode
    _focusNode.addListener(() {
      // field has focus
      if (_focusNode.hasFocus) {
        if(widget.onFieldFocused != null) widget.onFieldFocused!();

      // not focused
      } else {
        if(widget.onFieldUnfocused != null) widget.onFieldUnfocused!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.clear();
    _focusNode.dispose();
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
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,

        keyboardType: widget.inputType,
        controller: widget.controller,
        validator: widget.validator,

        //style
        style:
        const TextStyle(fontSize: 18, fontFamily: 'urbanist'),
        decoration: InputDecoration(

          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),

          prefixIcon: Opacity(
            opacity: 0.4,
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: widget.prefixIcon),
          ),

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
          filled: widget.filled,
          hintStyle: TextStyle(color: unFocusedColor, fontFamily: 'urbanist', fontSize: 16),
          hintText: widget.hint,
          label: widget.title != null ? Text(widget.title!,) : null,
          labelStyle: TextStyle(
              color: focusedColor, fontFamily: 'urbanist'
          ),

        ),
      ),
    );
  }
}
