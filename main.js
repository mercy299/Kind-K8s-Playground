const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World, This is Aniekeme!')
})

app.listen(port, () => {
  console.log(`My app is listening on port ${port}`)
})