part of poolz;

@NgController(selector: '[display-controller]')
class DisplayController{
  DisplayController(Scope scope, RouteProvider routeProvider, PoolService poolService, FilterMap filters){
    scope['pool'] = poolService.getPoolByIndex(int.parse(routeProvider.parameters['index']));
    
    // On peut appeler les filtres depuis un controlleur (peu d'intérêt ici)
    if(scope['pool'] != null){
      scope['computedDistrict'] = filters('district')(scope['pool']['zipcode']);
    }
  }
}