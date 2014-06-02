'use strict';

angular
  .module('placeholderApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'placeholderServices'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
