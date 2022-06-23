const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// Obtener todos los alumnos
router.get('/api/usuarios/', (req, res) => {
  mysqlConnection.query('SELECT ID, ID_USUARIO, USER, ROL, NOMBRE_USER, TELEFONO, CORREO FROM USUARIOS', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// Obtener un alumno por id
router.get('/api/usuarios/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM USUARIOS WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// Borrar un alumno por id
router.delete('/api/usuarios/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM USUARIOS WHERE id = ?', [id], (err, rows, fields) => {
    if(!err) {
      console.log(rows);
      res.json({status: 'Usuario Eliminado'});
    } else {
      console.log(err);
    }
  });
});

// Insertar un alumno
router.post('/api/usuarios/', (req, res) => {
  const {
    ID,
    ID_USUARIO,
    USER,
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO,
    ESTADO
  } = req.body;
  const query = `
    SET @ID = ?;
    SET @ID_USUARIO = ?;
    SET @USER = ?;
    SET @PASS = ?;
    SET @ROL = ?;
    SET @NOMBRE_USER = ?;
    SET @TELEFONO = ?;
    SET @CORREO = ?;
    SET @ESTADO = ?;
    CALL usuarioAddOrEdit(@ID, @ID_USUARIO, @USER,  @PASS, @ROL, @NOMBRE_USER, @TELEFONO, @CORREO, @ESTADO);
  `;
  mysqlConnection.query(query, [
    ID,
    ID_USUARIO, 
    USER, 
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO,
    ESTADO
    ], (err) => {
    if(!err) {
      mysqlConnection.query('SELECT ID, ID_USUARIO,	USER,	ROL,	NOMBRE_USER,	TELEFONO,	CORREO FROM USUARIOS WHERE ID_USUARIO=? ', [ID_USUARIO], (err, rows, fields) => {
        if (!err) {
         
          console.log(rows);
          res.status(200).json({user : rows[0]});
        } else {
          console.log(err);
        }
      });
    } else {
      console.log(err);
      res.status(300).json({"status": err.sqlMessage})
    }
  });
  

});


//Modificar un alumno por id
router.put('/api/usuarios/:ID', (req, res) => {
  const {
    ID_USUARIO,
    USER,
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO,
    ESTADO
  } = req.body;

  const { ID } = req.params;
  const query = `
    SET @ID = ?;
    SET @ID_USUARIO = ?;
    SET @USER = ?;
    SET @PASS = ?;
    SET @ROL = ?;
    SET @NOMBRE_USER = ?;
    SET @TELEFONO = ?;
    SET @CORREO = ?;
    SET @ESTADO = ?;
    CALL usuarioAddOrEdit(@ID, @ID_USUARIO, @USER,  @PASS, @ROL, @NOMBRE_USER, @TELEFONO, @CORREO,@ESTADO);
  `;
  mysqlConnection.query(query, [
    ID,
    ID_USUARIO, 
    USER, 
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO,
    ESTADO,
    ], (err, rows, fields) => {
      if(!err) {
        mysqlConnection.query('SELECT ID, ID_USUARIO,	USER,	ROL,	NOMBRE_USER,	TELEFONO,	CORREO FROM USUARIOS WHERE ID_USUARIO=? ', [ID_USUARIO], (err, rows, fields) => {
          if (!err) {
           
            console.log(rows);
            res.status(200).json({user : rows[0]});
          } else {
            console.log(err);
          }
        });
      } else {
        console.log(err);
        res.status(300).json({"status": err.sqlMessage})
      }
  });
});

module.exports = router;
