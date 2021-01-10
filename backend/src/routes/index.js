const express = require('express')

const menuRoutes = require('./menu')
const restaurantRoutes = require('./restaurant')

const router = express.Router()

router.get('/', function (req, res) {
  res.send('Hello World!')
})

router.use('/menu', menuRoutes)
router.use('/restaurant', restaurantRoutes)

module.exports = router

