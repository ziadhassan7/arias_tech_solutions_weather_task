import 'package:flutter/material.dart';


class TextView extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double scale;
  final TextDecoration? decoration;
  final double? opacity;

  const TextView(
      this.text,
      {
        Key? key,
        this.size,
        this.weight,
        this.color,
        this.maxLines,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.scale = 1,
        this.decoration,
        this.opacity,

      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,

      child: Text(
        text,

        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        textDirection: textDirection,
        overflow: overflow,

        style: getTheme(
          size: (size!=null)? size!*scale : size,
          weight: weight,
          color: color,
          decoration: decoration
        ),

      ),
    );
  }

  TextStyle getTheme({double? size, FontWeight? weight, Color? color, TextDecoration? decoration}){

    return TextStyle(fontFamily: 'inder', fontSize: size, fontWeight: weight, color: color, decoration: decoration);
  }

}