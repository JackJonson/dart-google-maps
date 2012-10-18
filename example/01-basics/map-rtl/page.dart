#import('dart:html');
#import('package:js/js.dart', prefix:'js');
#import('package:dart_google_maps/jswrap.dart', prefix:'jsw');
#import('package:dart_google_maps/gmaps.dart', prefix:'gmaps');

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..scaleControl = true
      ..center = new gmaps.LatLng(30.064742, 31.249509)
      ..zoom = 10
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;
    final map = new gmaps.GMap(query("#map_canvas"), mapOptions);

    final marker = new gmaps.Marker(new gmaps.MarkerOptions()
      ..map = map
      ..position = map.center
    );
    final gmaps.InfoWindow infowindow = new gmaps.InfoWindow();
    infowindow.content = '<b>القاهرة</b>';

    jsw.retainAll([infowindow, map, marker]);
    marker.on.click.add((e) {
      infowindow.open(map, marker);
    });
  });
}