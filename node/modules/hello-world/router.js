const { Router } = require('express');
const router = Router();
const ctrl = require('./ctrl')

router.get('/hello-world', ctrl.sendHelloWorldResponse);

module.exports = router;