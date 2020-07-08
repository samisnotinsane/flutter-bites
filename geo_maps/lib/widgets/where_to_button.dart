import 'package:flutter/material.dart';

class WhereToButton extends StatelessWidget {
  WhereToButton({@required this.onPressedHandler});

  final Function onPressedHandler;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: FlatButton(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 18.0,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Where to?',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPressedHandler,
        color: Colors.grey[300],
        textColor: Colors.grey[900],
      ),
    );
  }
}
