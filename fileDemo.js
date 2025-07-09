const fs = require('fs');
fs.writeFileSync('hello.txt','this file was created by node js ');
console.log('file writtten sucessfully');

const data = fs.readFileSync('hello.txt','utf-8');
console.log(data);

