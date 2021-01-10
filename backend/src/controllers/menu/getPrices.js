const knex = require('../../knexfile')

async function getPrices(req, res, next) {
    console.log(req.body)
    const {
        restaurant_id: restaurant_id,
        menus: menus
    } = req.body

    try {
        let result = {}

        await Promise.all(
            menus.map(async menu => {
                let prices = await knex
                    .select(knex.raw(`${menu.quantity} as total_quantity`), knex.raw(`p.price * ${menu.quantity} as food_subtotal`), 'dp.id as provider_id', 'dp.full_name as provider_name', 'dp.service_fee_rate', 'dp.delivery_fee')
                    .from({ p: 'price' })
                    .where('p.item_id', menu.item_id)
                    .innerJoin({ dp: 'delivery_provider' }, 'dp.id', 'p.delivery_provider')
                console.log(`here are my prices ${prices}`)
                prices.forEach(blob => {
                    const provider_name = blob.provider_name
                    if (Object.keys(result).includes(provider_name)) {
                        const provider = result[provider_name]

                        provider.total_quantity += blob.total_quantity
                        provider.food_subtotal += blob.food_subtotal
                    }
                    else {
                        result[provider_name] = {
                            total_quantity: blob.total_quantity,
                            food_subtotal: blob.food_subtotal,
                            delivery_fee: blob.delivery_fee,
                            service_fee_rate: blob.service_fee_rate,
                            provider_id: blob.provider_id,
                            provider_name: blob.provider_name
                        }
                    }
                })
            })
        )

        Object.keys(result).forEach(key => {
            const provider = result[key]

            provider.service_fee = provider.food_subtotal * provider.service_fee_rate
            provider.tax_fee = provider.food_subtotal * 0.15
            provider.total_price = provider.food_subtotal + provider.service_fee + provider.tax_fee

            delete provider.service_fee_rate
        })

        result = Object.values(result).sort((a, b) => a.total_price - b.total_price)

        return res.json({
            success: true,
            payload: result
        })

    }
    catch (err) {
        console.log(err)
        return res.json({
            success: false
        })
    }

}

module.exports = getPrices