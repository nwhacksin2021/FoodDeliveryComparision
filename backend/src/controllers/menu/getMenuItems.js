const knex = require('../../knexfile')

async function getMenuItems(req, res, next) {
    const { id: restaurant_id } = req.params
    let items = null
    try {
        items = await knex
            .select('i.id as item_id', 'i.item_category_id', 'i.name', 'i.description', 'i.restaurant_id', 'i.description', 'ic.full_name as category_full_name')
            .from({ i: 'item' })
            .where('i.restaurant_id', restaurant_id)
            .innerJoin({ ic: 'item_category' }, 'ic.id', 'i.item_category_id')

        await Promise.all(
            items.map(async item => {
                let prices = await knex
                    .select('dp.id as provider_id', 'dp.full_name as provider_name', 'p.price')
                    .from({ i: 'item' })
                    .where('i.restaurant_id', item.restaurant_id)
                    .where('i.id', item.item_id)
                    .innerJoin({ p: 'price' }, 'p.item_id', 'i.id')
                    .innerJoin({ dp: 'delivery_provider' }, 'dp.id', 'p.delivery_provider')
                item.prices = prices
                return item
            })
        )
        return res.json({
            success: true,
            payload: items
        })

    }
    catch (err) {
        console.log(err)
        return res.json({
            success: false
        })
    }

}

module.exports = getMenuItems