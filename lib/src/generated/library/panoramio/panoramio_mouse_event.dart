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

part of google_maps_panoramio;

class PanoramioMouseEvent extends jsw.TypedJsObject {
  static PanoramioMouseEvent cast(js.JsObject jsObject) => jsObject == null ? null : new PanoramioMouseEvent.fromJsObject(jsObject);
  PanoramioMouseEvent.fromJsObject(js.JsObject jsObject)
      : super.fromJsObject(jsObject);
  PanoramioMouseEvent();

  set featureDetails(PanoramioFeature featureDetails) => $unsafe['featureDetails'] = featureDetails;
  PanoramioFeature get featureDetails => PanoramioFeature.cast($unsafe['featureDetails']);
  set infoWindowHtml(String infoWindowHtml) => $unsafe['infoWindowHtml'] = infoWindowHtml;
  String get infoWindowHtml => $unsafe['infoWindowHtml'];
  set latLng(LatLng latLng) => $unsafe['latLng'] = latLng;
  LatLng get latLng => LatLng.cast($unsafe['latLng']);
  set pixelOffset(Size pixelOffset) => $unsafe['pixelOffset'] = pixelOffset;
  Size get pixelOffset => Size.cast($unsafe['pixelOffset']);
}
