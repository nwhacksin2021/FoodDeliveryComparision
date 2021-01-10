const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const dotenv = require('dotenv').config({ path: `${__dirname}/../.env` })

const routes = require('./routes')

const app = express()
const port = process.env.PORT || 3000

app.use('/api', routes)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})