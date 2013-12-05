part of poolz;

//@NgInjectableService
class PoolService{
  Http _http;
  
  PoolService(this._http);
  
  
  List _list;
  Future _listFuture;
  
  Future<List> getList(){
    if (_listFuture != null) {
      return _listFuture;
    }
    
    var completer = new Completer<List>();
    
    //if (_list != null) {
    //  completer.complete(_list);
    //} else {
      _http.get('pools.json').then((HttpResponse res){
        _list = res.data;
        completer.complete(_list);
        //_listFuture = null;
      });
    //}
    
    return _listFuture = completer.future;
  }
  
  Future<List> getMarkers(){
    return getList();
  }
  
  Map getPoolByIndex(int index) {
    return _list[index];
  }
  
}

class TestService{
  String _value;
  TestService(){
    _value = whatYouWant() ? "Dev" : "Prod";
  }
  
  
}