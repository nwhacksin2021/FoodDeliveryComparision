const express = require('express')
const cors = require('cors')

const routes = require('./routes')

const app = express()
const port = 3000

// app.use(cors)
console.log(routes)
app.use('/api', routes)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})