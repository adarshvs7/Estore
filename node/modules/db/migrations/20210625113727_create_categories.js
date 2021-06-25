
exports.up = function (knex) {
    return knex.schema.createTable('categories', t => {
        t.increments('id').primary()
        t.string('catname').notNullable()
        t.integer('parentId').defaultTo(0)
        t.integer('level').defaultTo(0) // 0,1,2
        t.timestamps(true, true)
    })
}

exports.down = function (knex) {
    return knex.schema.dropTable('categories')
}

