const { apiFmt } = require('../services/formatter');

function sendHelloWorldResponse(req, res, next) {
  const response = {
    message: 'Hello World'
  }
  res.json(apiFmt(response));
}

module.exports = {
  sendHelloWorldResponse
}