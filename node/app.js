const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();
const app = express();
var server = require('http').createServer(app);
app.use(bodyParser.json());
const baseUrl = `/v1`;
const port = process.env.PORT || 3000;
var cors = require('cors')
const helloWorld = require('./modules/hello-world/router');
const estore = require('./modules/estore/router');

app.use(cors({ origin: '*' }))
app.use(baseUrl, estore);
server.listen(port, function () {
  console.log('Express server of Logibids listening on port ' + port);
});