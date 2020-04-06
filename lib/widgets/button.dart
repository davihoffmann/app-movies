import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final bool showProgress;

  Button(this.text, this.callback, {this.showProgress = false});
  final backgroundColor1 = Colors.orange;
  final backgroundColor2 = Colors.red;
  final textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [backgroundColor1, backgroundColor2],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: FlatButton(
        onPressed: callback,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
      ),
    );
  }
}
