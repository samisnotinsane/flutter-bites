import 'package:flutter/material.dart';

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
            Placeholder(),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 0.3,
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
