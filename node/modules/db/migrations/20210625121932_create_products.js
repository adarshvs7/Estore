
exports.up = function (knex) {
    return knex.schema.createTable('products', t => {
        t.increments('id').primary()
        t.string('name').notNullable()
        t.float('price').notNullable()
        t.string('currency').defaultTo('$')
        t.integer('catId')
        t.integer('subIdLv1')
        t.integer('subIdLv2')
        t.timestamps(true, true)
    })
}

exports.down = function (knex) {
    return knex.schema.dropTable('products')
}

