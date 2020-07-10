import 'package:flutter/material.dart';

import '../model/destination.dart';
import 'where_to_recent_dest_tile.dart';

class WhereToRecentDestList extends StatelessWidget {
  const WhereToRecentDestList({
    @required this.destinations,
  });

  final List<Destination> destinations;

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
        itemBuilder: (context, index) =>
            WhereToRecentDestTile(destination: destinations[index]),
        itemCount: destinations.length,
      ),
    );
  }
}
