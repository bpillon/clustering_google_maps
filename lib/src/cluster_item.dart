import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:geohash/geohash.dart';

class ClusterItem<T> {
  final LatLng location;
  final String geohash;
  final T item;

  ClusterItem(this.location, {this.item})
      : geohash = Geohash.encode(location.latitude, location.longitude);

  static ClusterItem fromMap(Map<String, dynamic> map) =>
      ClusterItem(LatLng(map['lat'], map['long']));

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_${Random().nextInt(10000)}";
  }
}
