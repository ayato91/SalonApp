import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.size});
  final String text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: size ?? 18,
          fontWeight: FontWeight.w600),
    );
  }
}
