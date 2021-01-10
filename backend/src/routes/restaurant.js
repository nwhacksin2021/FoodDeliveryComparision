const express = require('express')
const restaurantRoutes = require('../controllers/restaurant')

const router = express.Router()

router.get('/:city', restaurantRoutes.getRestaurantsByCity)
router.get('/id/:id', restaurantRoutes.getRestaurantsById)

module.exports = router