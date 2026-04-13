import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  CustomCategoryCard({
    super.key,
    required this.CategoryIcon,
    required this.CategoryName,
  });

  final String CategoryIcon;
  final String CategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(CategoryIcon, style: TextStyle(fontSize: 32)),
          ),
        ),
        Text(
          CategoryName,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
