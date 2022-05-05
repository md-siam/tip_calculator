import 'package:flutter/material.dart';

class AmountText extends StatelessWidget {
  final String text;

  const AmountText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color(0xFF26C0AB),
      ),
    );
  }
}
