const knex = require('../../knexfile')

async function getRestaurantsByCity(req, res, next) {

    const { city: city } = req.params
    let restaurants = []
    try {
        restaurants = await knex
            .select('r.id as restaurant_id', 'r.restaurant_category_id', 'r.name', 'r.address', 'r.city', 'rc.full_name as category_full_name', 'r.opening_time', 'r.closing_time')
            .from({ r: 'restaurant' })
            .where('r.city', city)
            .innerJoin({ rc: 'restaurant_category' }, 'rc.id', 'r.restaurant_category_id')
            .orderBy('r.id', 'asc')

        await Promise.all(
            restaurants.map(async restaurant => {
                let providers = await knex
                    .select('dp.id as provider_id', 'dp.full_name as provider_name')
                    .from({ rp: 'restaurant_provider' })
                    .where('rp.restaurant_id', restaurant.restaurant_id)
                    .innerJoin({ dp: 'delivery_provider' }, 'dp.id', 'rp.provider_id')
                restaurant.providers = providers
                return restaurant
            })
        )

        return res.json({
            sucess: true,
            payload: restaurants
        })

    }
    catch (err) {
        console.log(err)
        next()
    }

}

module.exports = getRestaurantsByCity