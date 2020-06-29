import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final String name;
  final Color activeColor;

  CategoryCard({this.name, this.activeColor});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2/1,
      child: Container(
        margin: EdgeInsets.only(right:10),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: activeColor
        ),
      ),
    );
  }
}