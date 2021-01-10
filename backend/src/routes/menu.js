const express = require('express')
const menuRoutes = require('../controllers/menu')

const router = express.Router()

router.get('/:id', menuRoutes.getMenuItems)
router.post('/cart', menuRoutes.getPrices)

module.exports = router