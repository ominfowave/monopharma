import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWrapper extends StatelessWidget {
  final String? textShow;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;
  final bool? isRequired;
  final TextDecoration? textDecoration;
  final Color? decorationColor;

  const TextWrapper({
    super.key,
    required this.textShow,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textAlign,
    this.maxLine,
    this.overflow,
    this.isRequired,
    this.backgroundColor,
    this.textDecoration,
    this.fontStyle,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(textShow ?? "",
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow,
        softWrap: true,
        style: GoogleFonts.poppins(
          height: height ?? 1,
          color: textColor ?? Colors.black,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.normal,
          backgroundColor: backgroundColor,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor,
          fontStyle: fontStyle
        ),
    );
  }
}
