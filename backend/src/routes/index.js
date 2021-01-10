const express = require('express')

const menuRoutes = require('./menu')

const router = express.Router()

router.get('/', function (req, res) {
  res.send('Hello World!')
})

router.use('/menu', menuRoutes)
console.log(`this is router: ${router}`)

module.exports = router

