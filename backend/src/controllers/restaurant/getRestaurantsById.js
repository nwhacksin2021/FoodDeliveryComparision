const knex = require('../../knexfile')

async function getRestaurantsById(req, res, next) {

    const { id: restaurant_id } = req.params
    let result = [
        {
            restaurant_id: 1,
            restaurant_category_id: 1,
            name: 'Sushi House',
            address: '123 Test Street',
            city: 'Burnaby',
            category_full_name: 'Japanese',
            opening_time: '9:00',
            closing_time: '6:00',
            providers: [
                {
                    provider_id: 1,
                    provider_name: 'SkipTheDishes'
                },
                {
                    provider_id: 2,
                    provider_name: 'DoorDash'
                },
                {
                    provider_id: 3,
                    provider_name: 'UberEats'
                }
            ]
        },
        {
            restaurant_id: 2,
            restaurant_category_id: 5,
            name: 'Rolling Thunder',
            address: '888 Harvey Drive',
            city: 'Burnaby',
            category_full_name: 'Western',
            opening_time: '8:00',
            closing_time: '9:00',
            providers: [
                {
                    provider_id: 1,
                    provider_name: 'SkipTheDishes'
                },
                {
                    provider_id: 3,
                    provider_name: 'UberEats'
                }
            ]
        }
    ]
    // try {
    //     result = await knex
    //         .select('r.*', 'rc.full_name')
    //         .from({ r: 'restaurant' })
    //         .where('r.id', restaurant_id)
    //         .innerJoin({ rc: 'restaurant_category' }, 'rc.id', 'r.restaurant_category_id')
    // 
    // }
    // catch (err) {
    //     console.log(err)
    // }
    // 
    // console.log(result)

    return res.json({
        success: true,
        payload: result
    })

}

module.exports = getRestaurantsById