const express = require("express");
const User = require("../models/userModel");
const jwt=require('jsonwebtoken');
const authMiddleWare = require("../middlewares/authmiddleware");

// const app=express() //or
const authRouter=express.Router();
authRouter.post('/api/signup',async(req,res)=>{
    // try {
    //     const {req_name,req_email,req_profilepic}=req.body ;
       
    //     //email(userdata) is already exsist in db?
    //     //if yes -- and dont make request,dont store again 
    //    let user = await User.findOne({useremail:req_email});
    //     if(!user){ 
    //         //there is no user by this req_email in db
    //         //then we create a new user
    //         user=new User({
    //             username:req_name,
    //             useremail:req_email,
    //             userprofilepic:req_profilepic,
    //         });
    //         user=await user.save();
    //     }
    //     //if user is alrady in db then do nothing

    //     //now response to client
    //     res.json({user});
         
    // } catch (error) {
        
    // }
    try {
        /*
        {"username":"yash",
            "useremail":"vbvvv@gmail.com",
            "userprofilepic":"12dkfsfj"
            }
        */
        const {username,useremail,userprofilepic}=req.body ;
       
        //email(userdata) is already exsist in db?
        //if yes -- and dont make request,dont store again 
       let user = await User.findOne({useremail});
       console.log('api call');
        if(!user){ 
            //there is no user by this req_email in db
            //then we create a new user
            user=new User({
                username,
                useremail,
                userprofilepic,
            });
            user=await user.save();//add in db
        }
        else{
            console.log('user is present in db');
        }
        //if user is alrady in db then do nothing

        const token=jwt.sign({id:user._id},"passwordKey");
        console.log(token);
        //now response to client
        // res.status(200).json({user});
        // res.json({user,token}); //already 200
         
    } catch (e) {
        // console.log(error);
        res.status(500).json({error:e.message});
    }
});

authRouter.get("/",authMiddleWare,async (req,res)=>{
    //here auth is middlevare
    // const user=await User.findOne({_id:req.user});
    const user=await User.findById(req.user);//req.user has id
    const token=req.token;
    console.log(token)
    res.json({user,token:req.token });
})

module.exports=authRouter;