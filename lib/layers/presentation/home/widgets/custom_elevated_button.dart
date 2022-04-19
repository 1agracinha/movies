import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isActive;
  const CustomElevatedButton({
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
        width: 64,
        margin: const EdgeInsets.only(
            right: smSpacing, top: smSpacing, bottom: smSpacing),
        decoration: BoxDecoration(
          color: isActive ? Color.fromARGB(255, 72, 0, 130) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isActive
              ? [
                  BoxShadow(
                      color: Color.fromARGB(255, 72, 0, 130).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1))
                ]
              : [
                  BoxShadow(spreadRadius: 0, color: Colors.transparent),
                ],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: isActive ? Colors.white : Colors.black54, fontSize: 12, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
