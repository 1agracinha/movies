import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.pop(context)),
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_back,
          color: Colors.red,
        ),
      ),
    );
  }
}
