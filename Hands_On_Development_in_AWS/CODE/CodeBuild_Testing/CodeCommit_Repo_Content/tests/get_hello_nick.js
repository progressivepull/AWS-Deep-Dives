'use strict';

const supertest = require('supertest'); 
const test = require('unit.js');
const app = require('../app.js');

const request = supertest(app);

describe('Tests hello/nick', function() {
  it('verifies get /hello/nick', function(done) {
    request.get('/hello/nick').expect(200).end(function(err, result) {
      test.string(result.text).contains('hello nick');
      test.value(result).hasHeader('content-type', 'application/json');
      done(err);
    });
  });
});
