import 'package:flutter/material.dart';

import '../model/destination.dart';

class WhereToRecentDestTile extends StatelessWidget {
  const WhereToRecentDestTile({
    @required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RawMaterialButton(
          onPressed: null,
          shape: CircleBorder(),
          fillColor: Theme.of(context).accentColor,
          elevation: 0.2,
          child: destination.title.toUpperCase() == 'HOME'
              ? Icon(
                  Icons.home,
                  color: Theme.of(context).canvasColor,
                )
              : destination.title.toUpperCase() == 'WORK'
                  ? Icon(
                      Icons.work,
                      color: Theme.of(context).canvasColor,
                    )
                  : Icon(
                      Icons.history,
                      color: Theme.of(context).canvasColor,
                    ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              destination.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              destination.address,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
