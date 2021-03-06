import 'package:google_maps_flutter/google_maps_flutter.dart';

class AggregatedPoints<T> {
  final LatLng location;
  final int count;
  final Iterable<T> items;
  String bitmabAssetName;

  AggregatedPoints(this.location, this.count, {this.items}) {
    this.bitmabAssetName = getBitmapDescriptor();
  }

  static AggregatedPoints fromMap(
          Map<String, dynamic> map, String dbLatColumn, String dbLongColumn) =>
      AggregatedPoints(LatLng(map['lat'], map['long']), map['n_marker']);

  String getBitmapDescriptor() {
    String bitmapDescriptor;
    if (count < 10) {
      // + 2
      bitmapDescriptor = "assets/images/m1.png";
    } else if (count < 25) {
      // + 10
      bitmapDescriptor = "assets/images/m2.png";
    } else if (count < 50) {
      // + 25
      bitmapDescriptor = "assets/images/m3.png";
    } else if (count < 100) {
      // + 50
      bitmapDescriptor = "assets/images/m4.png";
    } else if (count < 500) {
      // + 100
      bitmapDescriptor = "assets/images/m5.png";
    } else if (count < 1000) {
      // +500
      bitmapDescriptor = "assets/images/m6.png";
    } else {
      // + 1k
      bitmapDescriptor = "assets/images/m7.png";
    }
    return bitmapDescriptor;
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_$count";
  }
}
