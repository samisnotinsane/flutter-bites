import 'package:flutter/material.dart';

import 'where_to_button.dart';

class WhereToSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          // Handlebar
          height: 5.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        Text(
          // Greeting
          'Good morning, Sameen',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
        ),
        WhereToButton(
          onPressedHandler: () {},
        ),
      ],
    );
  }
}
