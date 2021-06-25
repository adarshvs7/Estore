const { Router } = require('express');
const router = Router();
const ctrl = require('./ctrl');

router.get('/products/:id?', ctrl.getProducts);

module.exports = router;
