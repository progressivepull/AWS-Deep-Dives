'use strict';

const supertest = require('supertest'); 
const test = require('unit.js');
const app = require('../app.js');

const request = supertest(app);

describe('Tests root', function() {
  it('verifies get /', function(done) {
    request.get('/').expect(200).end(function(err, result) {
      test.string(result.text).contains('root');
      test.value(result).hasHeader('content-type', 'application/json');
      done(err);
    });
  });
});
