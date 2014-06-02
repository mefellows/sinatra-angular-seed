'use strict';

describe('Service: placeholderApi', function () {

  // load the service's module
  beforeEach(module('placeholderGeneratorApp'));

  // instantiate service
  var placeholderApi;
  beforeEach(inject(function (_placeholderApi_) {
    placeholderApi = _placeholderApi_;
  }));

  it('should do something', function () {
    expect(!!placeholderApi).toBe(true);
  });

});
