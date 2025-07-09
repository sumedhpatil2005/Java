const express = require('express')
const app = express()
const PORT = 8383
let data = {
    name : 'James'
} 
app.get('/',(req,res)=>{
    console.log("hit the server",req.method)
    res.send('<h1>homepage</h1>')

})

app.get('/dashboard',(req,res)=>{
    console.log("now i hit the /dashbo  ard endpoint")
    res.send('<h1>Dashboard </h1><input/>')
})

app.get('/api/data',(req,res)=>{
    console.log('this one was for data')
    res.send(data)
})
app.listen(PORT,()=> console.log(`server has started now : ${PORT}`))
   