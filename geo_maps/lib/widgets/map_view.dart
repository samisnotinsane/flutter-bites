import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  // Centres map on device location coordinates.
  _buildCameraPosition() => CameraPosition(
      target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      zoom: 16);

// Applies theme to map once it has loaded.
  _buildMap(GoogleMapController mapController) =>
      mapController.setMapStyle(_mapStyle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.65, // height (65%) = screen height (100%) - height of bottom card (35%)
      child: _currentPosition == null
          ? LoadingBlip()
          : GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: _buildCameraPosition(),
              onMapCreated: _buildMap,
            ),
    );
  }
}
