const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// Obtener todos los alumnos
router.get('/api/alumnos/', (req, res) => {
  mysqlConnection.query('SELECT * FROM ALUMNOS', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// Obtener un alumno por id
router.get('/api/alumnos/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM ALUMNOS WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// Borrar un alumno por id
router.delete('/api/alumnos/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM ALUMNOS WHERE id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Alumno Eliminado'});
    } else {
      console.log(err);
    }
  });
});

// Insertar un alumno
router.post('/api/alumnos/', (req, res) => {
  const {
    ID,
    ID_ALUMNO, 
    NOMBRES, 
    APELLIDOS,
    IDENTIFICACION,
    GENERO,
    CORREO,
    TELEFONO,
    DIRECCION,
    GRADO,
    OBSERVACIONES
  } = req.body;


  const query = `
    SET @ID = ?;
    SET @ID_ALUMNO = ?;
    SET @NOMBRES = ?;
    SET @APELLIDOS = ?;
    SET @IDENTIFICACION = ?;
    SET @GENERO = ?;
    SET @CORREO = ?;
    SET @TELEFONO = ?;
    SET @DIRECCION = ?;
    SET @GRADO = ?;
    SET @OBSERVACIONES = ?;
    CALL alumnoAddOrEdit(@ID, @ID_ALUMNO, @NOMBRES, @APELLIDOS, @IDENTIFICACION, @GENERO, @CORREO, @TELEFONO, @DIRECCION, @GRADO, @OBSERVACIONES);
  `;
  mysqlConnection.query(query, [
    ID,
    ID_ALUMNO, 
    NOMBRES, 
    APELLIDOS,
    IDENTIFICACION,
    GENERO,
    CORREO,
    TELEFONO,
    DIRECCION,
    GRADO,
    OBSERVACIONES
    ], (err, rows, fields) => {
    if(!err) {
      res.status(200).json({status: 'Alumno Guardado'});
    } else {
      console.log(err);
    }
  });

});
//Modificar un alumno por id
router.put('/api/alumnos/:ID', (req, res) => {
  const { 
    ID_ALUMNO, 
    NOMBRES, 
    APELLIDOS,
    IDENTIFICACION,
    GENERO,
    CORREO,
    TELEFONO,
    DIRECCION,
    GRADO,
    OBSERVACIONES
  } = req.body;
  const { ID } = req.params;
  const query = `
    SET @ID = ?;
    SET @ID_ALUMNO = ?;
    SET @NOMBRES = ?;
    SET @APELLIDOS = ?;
    SET @IDENTIFICACION = ?;
    SET @GENERO = ?;
    SET @CORREO = ?;
    SET @TELEFONO = ?;
    SET @DIRECCION = ?;
    SET @GRADO = ?;
    SET @OBSERVACIONES = ?;
    CALL alumnoAddOrEdit(@ID, @ID_ALUMNO, @NOMBRES, @APELLIDOS, @IDENTIFICACION, @GENERO, @CORREO, @TELEFONO, @DIRECCION, @GRADO, @OBSERVACIONES);
  `;
  mysqlConnection.query(query, [
    ID,
    ID_ALUMNO, 
    NOMBRES, 
    APELLIDOS,
    IDENTIFICACION,
    GENERO,
    CORREO,
    TELEFONO,
    DIRECCION,
    GRADO,
    OBSERVACIONES
  
  ], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Alumno actualizado'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
