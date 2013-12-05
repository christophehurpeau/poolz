part of poolz;

//@NgInjectableService
class SortService {
  String _currentSortValue = 'name';
  bool _isReverse = false;
  
  String get currentSortValue => _currentSortValue;
  bool get isReverse => _isReverse;
  
  bool reverse() => _isReverse = !_isReverse;
  
  void sortBy(String value){
    if (value == _currentSortValue) {
      reverse();
    } else {
      _currentSortValue = value;
    }
  }
  
}