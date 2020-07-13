import 'package:flutter/material.dart';

import 'widgets/map_view.dart';
import 'widgets/where_to_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Maps',
      theme: ThemeData(
        accentColor: Color(0xFFFF6238),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMapView(),
            DraggableScrollableSheet(
              initialChildSize: 0.35,
              minChildSize: 0.1,
              maxChildSize: 0.4,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  color: Theme.of(context).cardColor,
                  child: WhereToSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
