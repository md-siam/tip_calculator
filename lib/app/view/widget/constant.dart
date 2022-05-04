import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// background `color`
///
Color backgroundColor = const Color(0xFFC5E4E7);

/// default textStyle for `labels`
///
TextStyle labelText = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xFF5E7A7D),
);

/// default textStyle for `outputText`
///
TextStyle outputText = const TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: Color(0xFF26C0AB),
);

Widget background() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Center(child: SvgPicture.asset('assets/images/logo.svg')),
        ),
        const Expanded(flex: 4, child: SizedBox())
      ],
    );

Widget transparentContainer(double height) => Container(
      height: height,
      width: double.infinity,
      color: Colors.transparent,
    );

BoxDecoration containerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ],
);

Widget titleDesc(String title, String desc) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          style: const TextStyle(color: Color(0xFF7f9c9f)),
        ),
      ],
    );
