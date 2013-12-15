import 'dart:html';

import 'package:google_maps/google_maps.dart';

final DirectionsRendererOptions rendererOptions = new DirectionsRendererOptions()
  ..draggable = true;
final DirectionsRenderer directionsDisplay = new DirectionsRenderer(rendererOptions);
final DirectionsService directionsService = new DirectionsService();
GMap map;

final LatLng australia = new LatLng(-25.274398, 133.775136);

void main() {
  final mapOptions = new MapOptions()
    ..zoom = 7
    ..mapTypeId = MapTypeId.ROADMAP
    ..center = australia
    ;
  map = new GMap(querySelector("#map_canvas"), mapOptions);
  directionsDisplay.map = map;
  directionsDisplay.panel = querySelector('#directionsPanel');

  directionsDisplay.onDirectionsChanged.listen((_) {
    computeTotalDistance(directionsDisplay.directions);
  });

  calcRoute();
}

void calcRoute() {
  final request = new DirectionsRequest()
    ..origin = 'Sydney, NSW'
    ..destination = 'Sydney, NSW'
    ..waypoints = [
      new DirectionsWaypoint()..location = 'Bourke, NSW',
      new DirectionsWaypoint()..location = 'Broken Hill, NSW'
    ]
    ..travelMode = TravelMode.DRIVING // TODO bad object in example DirectionsTravelMode
    ;
  directionsService.route(request, (DirectionsResult response, DirectionsStatus status) {
    if (status == DirectionsStatus.OK) {
      directionsDisplay.directions = response;
    }
  });
}

void computeTotalDistance(DirectionsResult result) {
  num total = 0;
  final myroute = result.routes[0];
  for (int i = 0; i < myroute.legs.length; i++) {
    total += myroute.legs[i].distance.value;
  }
  total = total / 1000.0;  // TODO bad synthax in example
  querySelector('#total').innerHtml = '${total} km';
}