import 'package:flutter/material.dart';

class CustomNameWidget extends StatelessWidget {
  CustomNameWidget({super.key, required this.headingName});

  final String headingName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "See all",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.indigoAccent,
          ),
        ),
      ],
    );
  }
}
