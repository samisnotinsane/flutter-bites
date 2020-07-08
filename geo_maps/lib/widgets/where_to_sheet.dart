import 'package:flutter/material.dart';
import 'package:geo_maps/model/destination.dart';

import '../mock/mock_data.dart';
import 'where_to_button.dart';
import 'where_to_recent_dest_list.dart';

class WhereToSheet extends StatefulWidget {
  @override
  _WhereToSheetState createState() => _WhereToSheetState();
}

class _WhereToSheetState extends State<WhereToSheet> {
  final MockData _mockData = MockData();
  List<Destination> _destinations;

  @override
  void initState() {
    super.initState();
    addDummyDestinations();
    _destinations = _mockData.destinations;
  }

  void addDummyDestinations() {
    _mockData.addDestination = Destination(
      title: 'Home',
      address: 'Knightsbridge, London',
    );
    _mockData.addDestination = Destination(
      title: 'Work',
      address: 'Piccadilly, London',
    );
    _mockData.addDestination = Destination(
      title: 'Black Sheep Coffee',
      address: 'Leadenhall St, London',
    );
  }

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
        WhereToRecentDestList(destinations: _destinations),
      ],
    );
  }
}
