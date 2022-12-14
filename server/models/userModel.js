const mongoose =require('mongoose');

const userSchema=mongoose.Schema({
     username:{
        type:String,
        require: true
     },
     useremail:{
        type:String,
        require: true
     },
     userprofilepic:{
        type:String,
        require: true
     },
});

const User=mongoose.model("User",userSchema);
module.exports=User;