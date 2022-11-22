import 'package:flutter/material.dart';
import 'package:ph_check/util/style.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final Function() onPressed;
  const CustomTextButton(
      {super.key,
      required this.title,
      required this.padding,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: blueDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        padding: padding,
        child: Text(
          title,
          style: normalTextStyle.copyWith(color: black),
        ),
      ),
    );
  }
}
