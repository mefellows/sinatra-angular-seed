'use strict';

var placeholderServices = angular.module('placeholderServices', ['ngResource']);

placeholderServices.factory('Placeholder', ['$q', '$rootScope', '$interval', function($q, $rootScope, $interval) {
    // We return this object to anything injecting our service
    var Service = {};

    // Keep a pending request here
    var callback = {};

    var pongCallback = {};

    // TODO: Move this into constructor / DI?
    // Create our websocket object with the address to the websocket
    //var url = 'ws://' + window.location.host + '/socket';
    var url = 'ws://localhost:8080/socket';
    var ws = new WebSocket(url);

    ws.onopen = function(){
        console.log("Socket has been opened!");
        
        pingPong()
        console.log("Setup game of ping-pong")
    };

    ws.onclose = function(){
        console.log("Socket has been closed!");
    };

    ws.onmessage = function(response) {
        // Check for ping!
        var obj = JSON.parse(response.data)
        console.log(obj.message)

        if (obj.message != 'pong') {
            listener(obj);
        }
    };

    /**
     * Play ping/pong with the server to ensure keep alive.
     *
     * This requires the API to behave. Just send a 'pong' response
     *
     * @returns {*}
     */
    function pingPong() {

        var pong = function() {
            var request = JSON.stringify({'message': 'ping'});
            console.log('Sending pong request: ' + request);
            ws.send(request);
        }

        // Set refresh to every 10s
        var promise = $interval(pong, 10000);
        promise.then(function(result) {
            console.log("got pong result: " + result)
        });
    }

    /**
     * Send a socket request.
     *
     * @param request The JSON request.
     * @param _callback An optional request callback. Generally this is not required.
     * @returns {*}
     */
    function sendRequest(request, _callback) {
        var defer = $q.defer();

        if (_callback == null) {
            callback = {
                time: new Date(),
                cb:defer
            };

        }
        console.log('Sending request', request);
        ws.send(JSON.stringify(request));
        return defer.promise;
    }

    function listener(data) {
        $rootScope.$apply(callback.cb.resolve(data));
    }

    // Define a "getter" for getting some socket data
    Service.getResponse = function(message) {
        // Returns a $q.$promise
        return sendRequest(message);
    }

    return Service;
}]);