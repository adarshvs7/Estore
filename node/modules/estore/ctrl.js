const db = require('../db');
const { apiFmt } = require('../services/formatter');

async function getProducts(req, res, next) {
    try {
        const { id } = req.params;
        let response;
        if (id) {
            const query = db.getQueryBuilder('products')
                .where({ id })
                .first();
            response = await db.executeQuery(query);
            if (!response) throw new APIError(404, 'Product not Found');
        } else {
            const size = req.query.size || 'ALL';
            const from = req.query.from || 0;
            var search = req.query.search || '';
            let { catId, subIdLv1, subIdLv2 } = req.query;
            let query = db.getQueryBuilder('products as t')
                .select('t.*',db.createRaw(`'Categories' as cat_name`))
                .orderBy('t.id')
            let catQuery = db.getQueryBuilder('categories as t')
                .select('t.*')
                .groupBy('t.id').orderBy('t.id')

            if (catId) {
                query = query.where({ 't.catId': parseInt(catId) })
                    .select('t1.cat_name')
                    .leftJoin('categories as t1', function () {
                        this.on('t1.id', '=', 't.catId')
                    })
                catQuery = catQuery.where({ 't.parentId': parseInt(catId) })
                    .count('t1.*')
                    .leftJoin('products as t1', function () {
                        this.on('t1.catId', '=', 't.parentId')
                    })

            }
            if (subIdLv1) {
                query = query.where({ subIdLv1: parseInt(subIdLv1) })
                    .select('t1.cat_name')

                    .leftJoin('categories as t1', function () {
                        this.on('t1.id', '=', 't.subIdLv1')
                    })
                catQuery = catQuery.where({ 't.parentId': parseInt(subIdLv1) })
                    .count('t1.*')
                    .leftJoin('products as t1', function () {

                        this.on('t1.subIdLv1', '=', 't.parentId')
                    })
            }
            if (subIdLv2) {
                query = query.where({ subIdLv2: parseInt(subIdLv2) })
                    .select('t1.cat_name')

                    .leftJoin('categories as t1', function () {
                        this.on('t1.id', '=', 't.subIdLv2')
                    })
                catQuery = catQuery.where({ 't.id': parseInt(subIdLv2) })
                    .count('t1.*')
                    .leftJoin('products as t1', function () {
                        this.on('t1.subIdLv2', '=', 't.id')
                    })
            }
            if (!catId && !subIdLv1 && !subIdLv2) {
                catQuery = catQuery.where({ level: 0 })
                    .count('t1.*')
                    .leftJoin('products as t1', function () {
                        this.on('t1.catId', '=', 't.id')
                    })

            }
            let products = await db.executeQuery(query);
            let categories = await db.executeQuery(catQuery);

            response = {
                total: products.length,
                categories: categories,
                products: products
            }
        }
        res.json(apiFmt(response));
    } catch (e) {
        next(e);
    }
}

async function getCategories(req, res, next) {
    try {
        const { id } = req.params;
        let response;
        if (id) {
            const query = db.getQueryBuilder('products')
                .where({ id })
                .first();
            response = await db.executeQuery(query);
            if (!response) throw new APIError(404, 'Type not Found');
        } else {
            const size = req.query.size || 'ALL';
            const from = req.query.from || 0;
            var search = req.query.search || '';
            let query = db.getQueryBuilder('products')
            const types = await db.executeQuery(query);
            response = {
                total: types.length,
                types: types
            }
        }
        res.json(apiFmt(response));
    } catch (e) {
        next(e);
    }
}

module.exports = {
    getProducts
}
