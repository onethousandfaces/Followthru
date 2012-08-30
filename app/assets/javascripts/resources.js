// Setup application module to run with rails 
var module = angular.module('App', ['ngResource']);
module.config(["$httpProvider", function(provider) {
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);

// Setup a resource factory type for ninjas
module.factory('Ninja', function($resource) {
  return $resource('/ninjas/:id', {id : '@id'}, {
    'new' : { method: 'POST' },
    'save' : { method: 'PUT' },
  });
});
