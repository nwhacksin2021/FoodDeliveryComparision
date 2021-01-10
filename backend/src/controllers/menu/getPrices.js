const knex = require('../../knexfile')

async function getPrices(req, res, next) {
    //const {
    //    restaurant_id: restaurant_id,
    //    menus: menus
    //} = req.body

    let result = {
        response_code: 200,
        payload: [{
            total_quantity: 5,
            total_price: 20.00,
            food_subtotal: 15.00,
            service_fee: 2.50,
            tax_fee: 1.00,
            delivery_fee: 1.50,
            provider_id: 1,
            provider_name: 'SkipTheDishes'
        },
        {
            total_quantity: 5,
            total_price: 24.00,
            food_subtotal: 16.00,
            service_fee: 3.00,
            tax_fee: 1.50,
            delivery_fee: 3.50,
            provider_id: 2,
            provider_name: 'DoorDash'
        },
        {
            total_quantity: 5,
            total_price: 25.00,
            food_subtotal: 18.00,
            service_fee: 3.50,
            tax_fee: 1.50,
            delivery_fee: 2.00,
            provider_id: 3,
            provider_name: 'UberEats'
        }
        ]
    }
    // try {
    //     result = await knex
    //         .select('i.*', 'ic.full_name', 'p.price')
    //         .from({ i: 'item' })
    //         .where('i.id', restaurant_id)
    //         .innerJoin({ ic: 'item_category' }, 'ic.id', 'i.item_category_id')
    //         .innerJoin({ p: 'price' }, 'p.item_id', 'i.id')
    // }
    // catch (err) {
    //     console.log(err)
    //     return res.json({
    //         success: false
    //     })
    // }

    // console.log(result)

    return res.json({
        success: true,
        payload: result
    })

}

module.exports = getPrices