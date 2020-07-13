import 'package:flutter/material.dart';

import '../model/destination.dart';

class WhereToRecentDestTile extends StatelessWidget {
  const WhereToRecentDestTile({
    @required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior:
          HitTestBehavior.translucent, // includes tapping in 'blank' areas
      onTap: () => print('${destination.title} tapped'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RawMaterialButton(
            onPressed: null, // disables inkwell effect
            shape: CircleBorder(),
            fillColor: Theme.of(context).accentColor, // orange
            elevation: 0.2,
            child: destination.title.toUpperCase() == 'HOME'
                ? Icon(
                    Icons.home,
                    color: Theme.of(context).canvasColor, // white
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
                height: 6.0, // create space between title and address
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
      ),
    );
  }
}
