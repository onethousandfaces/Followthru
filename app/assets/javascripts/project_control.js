/** Controller for new project form */
var CreateProjectController = function($scope, Project) {
  $scope.project = new Project();
  $scope.hasErrors = false;
  $scope.errors = {};
  $scope.success = false;

  /** Create the project or list errors */
  $scope.create = function() {
    $scope.project.$create(function(data) {
      $scope.success = true;
      $scope.hasErrors = false;
    }, function(data) {
      var data = appErrorsAsArray(data);
      $scope.errors = data;
      $scope.hasErrors = data.length;
    });
  };
}

CreateProjectController.$inject = ['$scope', 'Project'];

/** Controller for list project form */
var ListProjectController = function($scope, Project) {
  $scope.projects = [];
  $scope.projectCount = 0;
  Project.query(function(data) {
    $scope.projects = data;
    $scope.projectCount = projects.length;
  });
}

ListProjectController.$inject = ['$scope', 'Project'];
