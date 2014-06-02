'use strict';

describe('Service: Placeholderservice', function () {

  // load the service's module
  beforeEach(module('placeholderGeneratorApp'));

  // instantiate service
  var Placeholderservice;
  beforeEach(inject(function (_Placeholderservice_) {
    Placeholderservice = _Placeholderservice_;
  }));

  it('should do something', function () {
    expect(!!Placeholderservice).toBe(true);
  });

});
