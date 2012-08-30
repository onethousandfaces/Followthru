var CreateProjectController = function($scope, Project) {
  $scope.project = new Project();

  /** Testing func */
  $scope.update = function() {
    alert('hi');
  };
}
CreateProjectController.$inject = ['$scope', 'Project'];
