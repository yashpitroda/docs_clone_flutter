const jwt=require("jsonwebtoken");
const authMiddleWare=async (req,res,next)=>{
    try {
        const token =req.header('x-auth-token');
        if(!token){
            return res.status(401).json({msg:"No auth token,acess denided"});//401 -- mean no authorization
        }
        const verified=jwt.verify(token,"passwordKey");
        if(!verified){
            return res.status(401).json({msg:"Token varification failed,authrizatin denided"});
        }
        req.user=verified.id;//req.user ==> we get verfied id
        req.token=token;
        next();
    } catch (e) {
        res.status(500).json({error:e.msg});
    }
}
module.exports = authMiddleWare;