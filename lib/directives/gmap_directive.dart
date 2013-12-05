part of poolz;

@NgDirective(selector: 'gmap')
class GMapDirective implements NgAttachAware{
  @NgOneWayOneTime('latitude') //@NgOneWay
  double lat;

  @NgOneWayOneTime('longitude')
  double lng;
  
  @NgOneWayOneTime('name')
  String name;
  
  Element element;
  
  GMapDirective(this.element){
    element.style.display = 'block';
  }
  
  
  void attach() {
    final mapOptions = new GMap.MapOptions()
    ..zoom = 13
    ..center = new GMap.LatLng(lat, lng)
    ..mapTypeId = GMap.MapTypeId.ROADMAP;
    final map = new GMap.GMap(element, mapOptions);
    
    var markerOptions = new GMap.MarkerOptions()
    ..position = map.center
    ..map = map
    ..title = name;
    final marker = new GMap.Marker(markerOptions);
    
  }
}