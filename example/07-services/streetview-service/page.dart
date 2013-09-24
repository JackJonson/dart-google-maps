import 'dart:html';

import 'package:google_maps/google_maps.dart';

GMap map;
final LatLng berkeley = new LatLng(37.869085,-122.254775);
final StreetViewService sv = new StreetViewService();

StreetViewPanorama panorama;

void main() {
  panorama = new StreetViewPanorama(query('#pano'));

  // Set up the map
  final mapOptions = new MapOptions()
    ..center = berkeley
    ..zoom = 16
    ..mapTypeId = MapTypeId.ROADMAP
    ..streetViewControl = false
    ;
  map = new GMap(query('#map_canvas'), mapOptions);

  // getPanoramaByLocation will return the nearest pano when the
  // given radius is 50 meters or less.
  map.onClick.listen((e) {
    sv.getPanoramaByLocation(e.latLng, 50, processSVData);
  });
}

void processSVData(StreetViewPanoramaData data, StreetViewStatus status) {
  if (status == StreetViewStatus.OK) {
    final marker = new Marker(new MarkerOptions()
      ..position = data.location.latLng
      ..map = map
      ..title = data.location.description
    );

    panorama.pano = data.location.pano;
    panorama.pov = new StreetViewPov()
      ..heading = 270
      ..pitch = 0
      ..zoom = 1
    ;
    panorama.visible = true;

    marker.onClick.listen((e) {
      final markerPanoID = data.location.pano;
      // Set the Pano to use the passed panoID
      panorama.pano = markerPanoID;
      panorama.pov = new StreetViewPov()
        ..heading = 270
        ..pitch = 0
        ..zoom = 1
      ;
      panorama.visible = true;
    });
  } else {
    window.alert('Street View data not found for this location.');
  }
}