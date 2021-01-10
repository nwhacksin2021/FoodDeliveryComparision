const knex = require('../../knexfile')

async function getRestaurantsByCity(req, res, next) {

    const { city: city } = req.params
    let result = null
    // try {
    //     result = await knex
    //         .select('r.*', 'rc.full_name')
    //         .from({ r: 'restaurant' })
    //         .where('r.city', city)
    //         .innerJoin({ rc: 'restaurant_category' }, 'rc.id', 'r.restaurant_category_id')
    // }
    // catch (err) {
    //     console.log(err)
    //     next()
    // }

    console.log(result)

    return res.json({ 
        success: true,
    })

}

module.exports = getRestaurantsByCity