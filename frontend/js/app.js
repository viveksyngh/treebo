'use strict';
var app = angular.module('hotel_app', ['ngRoute']);
var BASE_URL = "http://127.0.0.1:8000/";

// Route providers
app.config(function($routeProvider) {
	$routeProvider

    .when('/', {
	    templateUrl : 'partials/home.html',
	    controller  : 'mainController',
	    controllerAs: 'mainCtrl'
    })

   .otherwise({
    	redirectTo: '/404'
  })

});


app.controller("mainController", function($scope, $http){

  $scope.sort_by = 'rating';
  $scope.page = 1;
  $scope.query = '';

	$http({
            method: 'GET',
            data: {}, 
            url: BASE_URL + 'stats/',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            }).then(function successCallback(response) {
               console.log(response);
               $scope.max_price = response.data.result.max_price;
               $scope.min_price = response.data.result.min_price;
               $scope.avg_rating = response.data.result.avg_rating
               $scope.total_likes = response.data.result.total_likes;
               var area_object = response.data.result.area_distribution;
               var cities = Object.keys(area_object);
               console.log(cities);
               var area_distribution_string = '';
               for(var i=0; i < cities.length; i++) {
               		area_distribution_string += cities[i] + ": " + area_object[cities[i]];
               		if( i != cities.length - 1)
               			area_distribution_string += ', ';
               }
               console.log(area_distribution_string);
               $scope.area_distribution_string = area_distribution_string;
            }, 
                function errorCallback(response) {
                console.log("Error");
                console.log(response);
            });

    var _get_deals = function(page_num, sort_by){

          $http({
            method: 'GET',
            data: {}, 
            url: BASE_URL + 'list/?' + 'page=' + page_num
                          + '&sort_by=' + sort_by,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            }).then(function successCallback(response) {
               console.log(response);
               $scope.deals = response.data.result.deals;
            }, 
                function errorCallback(response) {
                console.log("Error");
                console.log(response);
            });
    }

    _get_deals($scope.page, $scope.sort_by);

    
    $scope.sort_result = function() {
      _get_deals($scope.page, $scope.sort_by);
    }

    $scope.do_search_query = function() {
      var query_param = $scope.query.trim();
      if (query_param && query_param.length >= 3) {
          $http({
            method: 'GET',
            data: {}, 
            url: BASE_URL + 'search/?' + 'query=' + query_param + 
                      '&page=' + $scope.page + '&sort_by=' + $scope.sort_by,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            }).then(function successCallback(response) {
               console.log(response);
               $scope.deals = response.data.result.deals;
            }, 
                function errorCallback(response) {
                console.log("Error");
                console.log(response);
            }); 
      }
    }

    var _like_hotel = function(hotel_id) {

          $http({
            method: 'POST',
            data: 'hotel_id='+ hotel_id, 
            url: BASE_URL + 'like/',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            }).then(function successCallback(response) {
               console.log(response);
            }, 
                function errorCallback(response) {
                console.log("Error");
                console.log(response);
            });
    };

    $scope.like = function(hotel_id) {
      _like_hotel(hotel_id);
    }

    $scope.get_filled_stars = function(rating) {
      var arr = [];
      for(var i = 1; i <= Math.round(rating); i++)
        arr.push(i);
      console.log(arr);
      return arr;
    }

    $scope.get_unfilled_stars = function(rating) {
      return new Array(5 - Math.round(rating));
    }
});