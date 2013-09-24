import 'dart:html';

import 'package:google_maps/google_maps.dart';
import 'package:google_maps/google_maps_places.dart';

void main() {
  final mapOptions = new MapOptions()
    ..mapTypeId = MapTypeId.ROADMAP
    ..center = new LatLng(-33.8665433, 151.1956316)
    ..zoom = 15
    ;
  final map = new GMap(query("#map_canvas"), mapOptions);


  final request = new PlaceDetailsRequest()
    ..reference = 'CnRkAAAAGnBVNFDeQoOQHzgdOpOqJNV7K9-c5IQrWFUYD9TNhUmz5-aHhfqyKH0zmAcUlkqVCrpaKcV8ZjGQKzB6GXxtzUYcP-muHafGsmW-1CwjTPBCmK43AZpAwW0FRtQDQADj3H2bzwwHVIXlQAiccm7r4xIQmjt_Oqm2FejWpBxLWs3L_RoUbharABi5FMnKnzmRL2TGju6UA4k'
    ;

  final infowindow = new InfoWindow();
  final service = new PlacesService(map);

  service.getDetails(request, (place, status) {
    if (status == PlacesServiceStatus.OK) {
      final marker = new Marker(new MarkerOptions()
        ..map = map
        ..position = place.geometry.location
      );
      marker.onClick.listen((e) {
        infowindow.content = place.name;
        infowindow.open(map, marker);
      });
    }
  });
}