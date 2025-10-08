var restify = require('restify');

function respond_index(req, res, next) {
  res.send('root');
  next();
}

function respond(req, res, next) {
  res.send('hello ' + req.params.name);
  next();
}

var server = restify.createServer();

server.get('/hello/:name', respond);
server.get('/', respond_index);

module.exports = server.listen(8080, function() {
  console.log('%s listening at %s', server.name, server.url);
});
