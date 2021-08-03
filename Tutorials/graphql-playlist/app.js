const express = require('express');

const app = express();


app.listen(4000, ()=> {
  // callback function which tells us that we're listening for 
  // ... requests
  console.log('now listening for requests on port 4000');
  
  
});