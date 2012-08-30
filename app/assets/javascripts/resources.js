// Setup application module to run with rails 
var module = angular.module('App', ['ngResource']);
module.config(["$httpProvider", function(provider) {
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);

// Setup a resource factory type for each REST api
(function() {
  module.factory('Goal', function($resource) {
    return $resource('/ajax/goals/:id', {id : '@id'}, {
      'create' : { method: 'POST' },
      'save' : { method: 'PUT' },
    });
  });

  module.factory('Pledge', function($resource) {
    return $resource('/ajax/pledges/:id', {id : '@id'}, {
      'create' : { method: 'POST' },
      'save' : { method: 'PUT' },
    });
  });

  module.factory('PledgeType', function($resource) {
    return $resource('/ajax/pledge_types/:id', {id : '@id'}, {
      'create' : { method: 'POST' },
      'save' : { method: 'PUT' },
    });
  });

  module.factory('Project', function($resource) {
    return $resource('/ajax/projects/:id', {id : '@id'}, {
      'create' : { method: 'POST' },
      'save' : { method: 'PUT' },
    });
  });
})();

// Common helper functions
function appErrorsAsArray(data) {
  var _data = [];
  for (var i in data.data) {
    for (var j in data.data[i]) {
      if ((i) && (j)) {
        var item = {
          'field' : i,
          'error' : data.data[i][j]
        };
        _data.push(item);
      }
    }
  }
  return _data;
}
