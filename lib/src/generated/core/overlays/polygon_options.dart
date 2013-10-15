// Copyright (c) 2012, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_maps;

class PolygonOptions extends jsw.TypedJsObject {
  static PolygonOptions cast(js.JsObject jsObject) => jsObject == null ? null : new PolygonOptions.fromJsObject(jsObject);
  PolygonOptions.fromJsObject(js.JsObject jsObject)
      : super.fromJsObject(jsObject);
  PolygonOptions()
      : super();

  set clickable(bool clickable) => $unsafe['clickable'] = clickable;
  bool get clickable => $unsafe['clickable'];
  set draggable(bool draggable) => $unsafe['draggable'] = draggable;
  bool get draggable => $unsafe['draggable'];
  set editable(bool editable) => $unsafe['editable'] = editable;
  bool get editable => $unsafe['editable'];
  set fillColor(String fillColor) => $unsafe['fillColor'] = fillColor;
  String get fillColor => $unsafe['fillColor'];
  set fillOpacity(num fillOpacity) => $unsafe['fillOpacity'] = fillOpacity;
  num get fillOpacity => $unsafe['fillOpacity'];
  set geodesic(bool geodesic) => $unsafe['geodesic'] = geodesic;
  bool get geodesic => $unsafe['geodesic'];
  set map(GMap map) => $unsafe['map'] = map;
  GMap get map => GMap.cast($unsafe['map']);
  dynamic /*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ get paths {
    final result = $unsafe['paths'];
    if (MVCArray.isInstance(result)) {
      return MVCArray.castListOfSerializables(result, (e) => LatLng.isInstance(e) ? LatLng.cast(e) : MVCArray.castListOfSerializables(e, LatLng.cast));
    }
    return jsw.TypedJsArray.castListOfSerializables(result, (e) => LatLng.isInstance(e) ? LatLng.cast(e) : jsw.TypedJsArray.castListOfSerializables(e, LatLng.cast));
  }
  set paths(dynamic /*MVCArray.<MVCArray.<LatLng>>|MVCArray.<LatLng>|Array.<Array.<LatLng>>|Array.<LatLng>*/ paths) => $unsafe['paths'] = paths == null ? null : paths is js.Serializable ? paths : paths is List ? js.jsify(paths) : paths;
  set strokeColor(String strokeColor) => $unsafe['strokeColor'] = strokeColor;
  String get strokeColor => $unsafe['strokeColor'];
  set strokeOpacity(num strokeOpacity) => $unsafe['strokeOpacity'] = strokeOpacity;
  num get strokeOpacity => $unsafe['strokeOpacity'];
  set strokePosition(StrokePosition strokePosition) => $unsafe['strokePosition'] = strokePosition;
  StrokePosition get strokePosition => StrokePosition.find($unsafe['strokePosition']);
  set strokeWeight(num strokeWeight) => $unsafe['strokeWeight'] = strokeWeight;
  num get strokeWeight => $unsafe['strokeWeight'];
  set visible(bool visible) => $unsafe['visible'] = visible;
  bool get visible => $unsafe['visible'];
  set zIndex(num zIndex) => $unsafe['zIndex'] = zIndex;
  num get zIndex => $unsafe['zIndex'];
}
