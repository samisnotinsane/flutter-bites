import 'package:flutter/material.dart';

import '../model/destination.dart';

class WhereToRecentDestList extends StatelessWidget {
  const WhereToRecentDestList({
    Key key,
    @required List<Destination> destinations,
  })  : _destinations = destinations,
        super(key: key);

  final List<Destination> _destinations;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // [Expanded] prevents vertical overflow
      child: ListView.separated(
        shrinkWrap: true, // prevent setting height to infinity
        padding: EdgeInsets.all(0), // remove default padding
        separatorBuilder: (context, index) => Divider(
          // 16% of screen width
          indent: MediaQuery.of(context).size.width * 0.16,
        ),
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.history),
          title: Text(_destinations[index].title),
          subtitle: Text(_destinations[index].address),
        ),
        itemCount: _destinations.length,
      ),
    );
  }
}
