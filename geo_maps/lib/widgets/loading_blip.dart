import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBlip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.grey[300],
      child: SpinKitPulse(
        color: Theme.of(context).indicatorColor,
        size: 50.0,
      ),
    );
  }
}
