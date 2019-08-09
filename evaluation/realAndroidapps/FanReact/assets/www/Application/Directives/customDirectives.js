window.AngularInstance.directive('elementHeader', function() {
  return {
    scope: {
      data: '=data'
    },
    templateUrl: 'Application/Views/elementHeader.html'
  };
});