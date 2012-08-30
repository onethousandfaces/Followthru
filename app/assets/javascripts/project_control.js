/** Controller for new project form */
var CreateProjectController = function($scope, Project) {
  $scope.project = new Project();
  $scope.hasErrors = false;
  $scope.errors = {};

  /** Create the project or list errors */
  $scope.create = function() {
    $scope.project.$create(function(data) {
      alert(data);
    }, function(data) {
      var data = appErrorsAsArray(data);
      $scope.errors = data;
      $scope.hasErrors = data.length;
    });
  };
}

CreateProjectController.$inject = ['$scope', 'Project'];
