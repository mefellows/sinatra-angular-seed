'use strict';

angular.module('placeholderApp')
    .controller('MainCtrl', ['$scope', '$http', 'Placeholder', function ($scope, $http, Placeholder) {

        // Default website
        $scope.message = 'Sockets will replace me - enter stuff above to find out!'

        /**
         * Generate a Placeholder
         */
        $scope.generatePlaceholder = function (ping) {

            var data = Placeholder.getResponse({'message': ping})
            data.then(function (result) {
                console.log(result)

                $scope.message = 'API said: ' + result.message;
            });
        }
    }]);