#import('dart:html');
#import('../../../../gmaps.dart', prefix:'gmaps');
#import('../../../../gmaps-geometry.dart', prefix:'gmaps_geo');

gmaps.Polyline poly;
gmaps.Polyline geodesicPoly;
gmaps.Marker marker1;
gmaps.Marker marker2;

void main() {
  final mapOptions = new gmaps.MapOptions()
    ..center = new gmaps.LatLng(34, -40.605)
    ..zoom = 4
    ..mapTypeId = gmaps.MapTypeId.ROADMAP
    ;

  final map = new gmaps.GMap(query("#map_canvas"), mapOptions);

  // TODO ControlPosition.TOP does not exists
  map.controls.getNodes(gmaps.ControlPosition.TOP_CENTER).push(query('#info'));


  marker1 = new gmaps.Marker(new gmaps.MarkerOptions()
    ..map = map
    ..draggable = true
    ..position = new gmaps.LatLng(40.71435280, -74.0059731)
  );

  marker2 = new gmaps.Marker(new gmaps.MarkerOptions()
    ..map = map
    ..draggable = true
    ..position = new gmaps.LatLng(48.8566140, 2.35222190)
  );

  final bounds = new gmaps.LatLngBounds(marker1.getPosition(), marker2.getPosition());
  map.fitBounds(bounds);

  gmaps.Events.addListener(marker1, 'position_changed', (e) => update());
  gmaps.Events.addListener(marker2, 'position_changed', (e) => update());

  final polyOptions = new gmaps.PolylineOptions()
    ..strokeColor = '#FF0000'
    ..strokeOpacity = 1.0
    ..strokeWeight = 3
    ..map = map
    ;
  poly = new gmaps.Polyline(polyOptions);

  final geodesicOptions = new gmaps.PolylineOptions()
    ..strokeColor = '#CC0099'
    ..strokeOpacity = 1.0
    .. strokeWeight = 3
    ..geodesic = true
    ..map = map
    ;
  geodesicPoly = new gmaps.Polyline(geodesicOptions);

  update();
}

void update() {
  final path = [marker1.getPosition(), marker2.getPosition()];
  poly.setPath(path);
  geodesicPoly.setPath(path);
  final heading = gmaps_geo.Spherical.computeHeading(path[0], path[1]);
  (query('#heading') as InputElement).value = heading.toString();
  (query('#origin') as InputElement).value = path[0].toString();
  (query('#destination') as InputElement).value = path[1].toString();
}