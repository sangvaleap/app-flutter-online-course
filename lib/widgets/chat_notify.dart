import 'package:flutter/material.dart';

class ChatNotify extends StatelessWidget {
  ChatNotify({
    Key? key,
    required this.number,
    this.boxSize = 30,
    this.color = Colors.red,
  }) : super(key: key);

  final int number;
  final double boxSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: number > 0,
      child: Container(
        alignment: Alignment.center,
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Text(
          "$number",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
