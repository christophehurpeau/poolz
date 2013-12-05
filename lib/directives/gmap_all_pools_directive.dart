part of poolz;


final ParisCoorinates = [48.856638, 2.352241];

@NgDirective(selector: 'gmap-all-pools')
class GMapAllPoolsDirective implements NgAttachAware{
  List _markers;
  
  Element element;
  
  GMapAllPoolsDirective(this.element, PoolService poolService){
    element.style.display = 'block';
  }
  
  @NgOneWay('markers') //NgOneWayOneTime
  set markers(List markers){
    if (_markers == null || _markers.length != markers.length) {
      _markers = markers;
      update();
    }
  }
  
  GMap.GMap map;
  List<GMap.Marker> mapMarkers = [];
  
  void attach() {
    print('attach');
    final mapOptions = new GMap.MapOptions()
      ..zoom = 12
      ..center = new GMap.LatLng(ParisCoorinates[0], ParisCoorinates[1])
      ..mapTypeId = GMap.MapTypeId.ROADMAP;
    map = new GMap.GMap(element, mapOptions);
    
    if (_markers != null) {
      update();
    }
  }
  
  void update() {
    if (map == null) {
      return;
    }
    //http://stackoverflow.com/questions/1544739/google-maps-api-v3-how-to-remove-all-markers
    for (var marker in mapMarkers)
      marker.map = null;
    mapMarkers.clear();
    
    //poolService.getMarkers().then((List markers){
      _markers.forEach((Map pool){
        var markerOptions = new GMap.MarkerOptions()
          ..position = new GMap.LatLng(pool['lat'], pool['lng'])
          ..map = map
          ..title = pool['name'];
        final marker = new GMap.Marker(markerOptions);
        mapMarkers.add(marker);
      });
    //});
  }
}