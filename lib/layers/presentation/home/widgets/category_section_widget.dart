import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';

class CategorySectionWidget extends StatelessWidget {
  final String sectionName;
  final Function onTapViewAll;
  const CategorySectionWidget({
    Key? key,
    required this.sectionName,
    required this.onTapViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing, right: smSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  sectionName,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.red.withOpacity(0.2)),
                ),
                child: const Text(
                  'view all',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onPressed: () => onTapViewAll(),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: normalSpacing,
          endIndent: normalSpacing,
        )
      ],
    );
  }
}
