const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const dotenv = require('dotenv').config({ path: `${__dirname}/../.env` })

const routes = require('./routes')

const app = express()
// app.use(express.json)
// app.use(cors)
// app.use(bodyParser.urlencoded({ extended: false }))
// app.use(bodyParser.json)
const port = process.env.PORT || 3000

// app.use(cors)
// app.use(cors)
app.use('/api', routes)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})