angular.module('animated-checkmark', []).directive('animatedCheck', animatedCheck);
function animatedCheck() {
    const svgTemplate ='<div class="checkmark-container"> <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52"> <g><circle class="checkmark-outline" cx="26" cy="26" r="25" fill="none" /><circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none" /><path class="checkmark-check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />'+
     '</g></svg></div>';

  return {
    restrict: 'E',
    replace: true,
    template: svgTemplate,
    link: function(scope, element, attrs) {
      scope.$watch(attrs.isChecked, function(val) {
        if (val) {
          element.addClass('checked');
        } else {
          element.removeClass('checked');
        }
      })
    }
  }
}