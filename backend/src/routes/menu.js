const express = require('express')
const menuRoutes = require('../controllers/menu')

const router = express.Router()

router.get('/:id', menuRoutes.getMenuItems)

module.exports = router