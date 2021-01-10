const knex = require('../../knexfile')

async function getMenuItems(req, res, next) {
    const { id: restaurant_id } = req.params
    let result = {
        response_code: 200,
        payload: [{
            item_id: 1,
            item_category_id: 1,
            name: 'California Roll',
            restaurant_id: restaurant_id,
            description: 'Imitation Crab and Avocado Roll',
            category_full_name: 'Rolls',
            prices: [{
                provider_id: 1,
                provider_name: 'SkipTheDishes',
                price: 3.50
            },
            {
                provider_id: 2,
                provider_name: 'DoorDash',
                price: 3.75
            },
            {
                provider_id: 3,
                provider_name: 'UberEats',
                price: 3.00
            }
            ]
        },
        {
            item_id: 6,
            item_category_id: 4,
            name: 'Salmon Sashimi',
            restaurant_id: restaurant_id,
            description: '6 pcs sliced salmon sashimi',
            category_full_name: 'Sashimi',
            prices: [{
                provider_id: 1,
                provider_name: 'SkipTheDishes',
                price: 3.50
            },
            {
                provider_id: 2,
                provider_name: 'DoorDash',
                price: 3.75
            },
            {
                provider_id: 3,
                provider_name: 'UberEats',
                price: 3.00
            }
            ]
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

module.exports = getMenuItems