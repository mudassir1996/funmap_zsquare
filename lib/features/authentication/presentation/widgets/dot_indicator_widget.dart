import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool selected;

  const DotIndicator({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Color c1 = Colors.white;
    const Color c2 = Color.fromRGBO(158, 164, 252, 1);

    Color dotColor = selected
        ? c1
        : c2; // Update color based on selected value

    return Container(
      padding: EdgeInsets.all(20),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
    );
  }
}