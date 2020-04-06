import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  Link(
    this.text,
    this.onPressed,
    {this.color = Colors.blue}
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}