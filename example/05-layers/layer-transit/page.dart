import 'dart:html';
import 'package:google_maps/google_maps.dart';

void main() {
  final myLatlng = new LatLng(51.501904,-0.115871);
  final mapOptions = new MapOptions()
    ..zoom = 13
    ..center = myLatlng
    ..mapTypeId = MapTypeId.ROADMAP
    ;
  final map = new GMap(querySelector("#map_canvas"), mapOptions);

  final transitLayer = new TransitLayer();
  transitLayer.map = map;
}
