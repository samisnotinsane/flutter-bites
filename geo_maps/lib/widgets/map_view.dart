import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'loading_blip.dart';

class GoogleMapView extends StatefulWidget {
  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  String _mapStyle;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/map_style.json')
        .then((value) => _mapStyle = value); // loads custom map theme
    _getCurrentLocation(); // uses geolocator to acquire device position
  }

  void _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then(
          (position) => setState(() {
            _currentPosition = position;
            print(_currentPosition);
          }),
        )
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.65, // height (65%) = screen height (100%) - height of bottom card (35%)
      child: _currentPosition == null ? LoadingBlip() : Placeholder(),
    );
  }
}
