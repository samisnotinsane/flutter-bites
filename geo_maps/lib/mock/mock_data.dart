import 'dart:collection';

import '../model/destination.dart';

class MockData {
  final List<Destination> _destinations = [];

  UnmodifiableListView<Destination> get destinations =>
      UnmodifiableListView(_destinations);

  set addDestination(Destination destination) => _destinations.add(destination);
}
