const express=require("express");
const mongoose =require("mongoose");
const cors=require('cors');
const authRouter = require("./routes/auth");

//  "nodemon": "^2.0.20" is add in dev-dep bcz it use only dev side
//to run index.js with nodemon -- npm run dev 

const PORT=process.env.PORT | 3001; 

const app=express();

app.use(cors());
app.use(express.json());
app.use(authRouter);

const DB="mongodb+srv://yashpitroda:1234@cluster0.xgbpf1h.mongodb.net/?retryWrites=true&w=majority";

mongoose.connect(DB).then(()=>{
    // console.log(v);
    console.log("Connection successful with mongo!");
}).catch((err)=>{
    console.log(err);
})

app.listen(PORT,"0.0.0.0",()=>{ 
    // console.log("conected");
    console.log(`conected ${PORT}`);
});