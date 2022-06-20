const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// Obtener todos los alumnos
router.post('/api/auth/signin/', (req, res) => {
    
    mysqlConnection.query('SELECT ID, ID_USUARIO, ROL, NOMBRE_USER, CORREO, TELEFONO FROM usuarios where user="'+req.body.email+'" && pass="'+req.body.password+'" && estado=1;', (err, rows, fields) => {
        console.log(req.body);
        if(!err) {
            if(rows.length>0){
                res.status(200).json(rows);
            }else{
                res.status(403).json({status: 'Usuario o contraseña incorrectos'});
            }
        } else {
            console.log(err);
        }
    });  
});
module.exports=router;