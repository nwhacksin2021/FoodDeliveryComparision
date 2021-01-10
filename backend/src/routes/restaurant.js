const express = require('express')
const restaurantRoutes = require('../controllers/restaurant')

const router = express.Router()

router.get('/:id', restaurantRoutes.getRestaurantsById)
router.get('/city/:city', restaurantRoutes.getRestaurantsByCity)

module.exports = router