part of poolz;


@NgController(selector: '[list-controller]', publishAs: 'list')
class ListController {
  
  final PoolService _poolService;
  final Router _router;
  final SortService _sortService;
  
  //
  
  List pools = [];
  
  String filterText = '';
  
  ListController(this._poolService, this._router, this._sortService) {
    _poolService.getList()
      .then((list) => pools = list);
  }
  
  
  List get markers => pools;
  
  viewPool(poolIndex) {
    _router.go('display', { 'index': poolIndex });
  }
  
  
  String get currentSort => _sortService.currentSortValue;
  bool get isReverse => _sortService.isReverse;
  
  sortBy(sortValue) => _sortService.sortBy(sortValue);
}