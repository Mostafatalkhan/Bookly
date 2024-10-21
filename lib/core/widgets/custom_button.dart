import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backGroundcolor,
    required this.textcolor,
    required this.borderRadius,
    this.fontSize,
    required this.onPressed,
  });
  final String text;
  final Color backGroundcolor;
  final Color textcolor;
  final BorderRadiusGeometry? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 48,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16)),
      color: backGroundcolor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textcolor,
            fontWeight: FontWeight.w900,
            fontSize: fontSize ?? 18),
      ),
    );
  }
}
