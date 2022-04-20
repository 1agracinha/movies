import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isActive;
  const CustomElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: normalSpacing,
          vertical: smSpacing,
        ),
        margin: const EdgeInsets.only(
          right: smSpacing,
          top: smSpacing,
          bottom: smSpacing,
        ),
        decoration: BoxDecoration(
          color: getColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [getBoxShadow],
        ),
        child: Center(
          child: Text(
            text,
            style: getTextStyle,
          ),
        ),
      ),
    );
  }

  TextStyle get getTextStyle => TextStyle(
      color: isActive ? Colors.white : Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.bold);

  Color get getColor =>
      isActive ? const Color.fromARGB(255, 146, 0, 0) : Colors.white;

  BoxShadow get getBoxShadow => isActive
      ? BoxShadow(
          color: const Color.fromARGB(255, 151, 0, 0).withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 1))
      : const BoxShadow(spreadRadius: 0, color: Colors.transparent);
}
