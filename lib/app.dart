library poolz;


import 'dart:html';
import 'dart:async';
//import 'dart:convert' show JSON;

import 'package:angular/angular.dart';

import 'package:google_maps/google_maps.dart' as GMap;

part 'controllers/list.dart';
part 'controllers/display.dart';

part 'filters/district_filter.dart';

part 'services/pool_service.dart';
part 'services/sort_service.dart';

part 'directives/gmap_all_pools_directive.dart';
part 'directives/gmap_directive.dart';


AngularModule poolzModule() {
  var test = "test";
  
  return new AngularModule()
    ..type(ListController)
    ..type(DisplayController)
    
    ..type(DistrictFilter)
    
    ..type(PoolService)
    ..type(SortService)
    
    ..type(GMapAllPoolsDirective)
    ..type(GMapDirective)
    
//    ..type(Router, implementedBy: AppRouter)
    
    ..type(RouteInitializer, implementedBy: AppRouteInitializer);
}

class AppRouter extends Router{

  AppRouter({bool useFragment, Window windowImpl})
      : super(useFragment: false, windowImpl: windowImpl);

}

class AppRouteInitializer extends RouteInitializer{
  void init(Router router, ViewFactory viewFactory) {
    router.root
      ..addRoute(
          defaultRoute: true,
          name: 'list',
          enter: viewFactory('partials/list.html')
        )
      ..addRoute(
          name: 'display',
          path: '#/display/:index',
          enter: viewFactory('partials/display.html')
        );
  }
}
