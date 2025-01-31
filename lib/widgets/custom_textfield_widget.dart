import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWrapper extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool readOnly;
  final Color? color;
  final Color? hintColor;
  final TextInputType? textInputType;
  final bool isValidate;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final InputBorder? inputBorder;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final FocusNode? focusNode;
  final double? fontSize;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final Color? fillColor;
  final bool isLabel;

  const TextFieldWrapper(
      {Key? key,
      this.hintText,
      required this.textEditingController,
      required this.readOnly,
      this.color,
      this.hintColor,
      this.textInputType,
      required this.isValidate,
      this.validator,
      this.maxLength,
      this.maxLines,
      this.onTap,
      this.onChanged,
      this.suffixIcon,
      this.textInputAction,
      this.inputBorder,
      this.edgeInsetsGeometry,
      this.focusNode,
      this.fontSize,
      this.inputFormatters,
      this.textAlign,
      this.fillColor,
      this.prefixIcon,
      required this.isLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: textEditingController,
      readOnly: readOnly,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: GoogleFonts.poppins(color: color, fontSize: fontSize),
      validator: isValidate ? validator : null,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
          border: inputBorder,
          hintText: hintText,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          hintStyle: GoogleFonts.poppins(fontSize: fontSize, color: hintColor),
          hintMaxLines: 3,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          isDense: false, // important line
          contentPadding: edgeInsetsGeometry, // control your hints text size
          counterText: "",
          labelText: hintText,
          alignLabelWithHint: true,
          labelStyle: GoogleFonts.poppins(fontSize: fontSize, color: color)),
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      focusNode: focusNode,
    );
  }
}
