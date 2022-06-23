USE escuelawhatsapp;

DELIMITER $$
USE `escuelawhatsapp`$$

CREATE PROCEDURE `alumnoAddOrEdit` (
  IN _ID INT,
  IN _ID_ALUMNO  VARCHAR(45),  
  IN _NOMBRES  VARCHAR(45),
  IN _APELLIDOS  VARCHAR(45),
  IN _IDENTIFICACION  VARCHAR(45),
  IN _GENERO  VARCHAR(45),
  IN _CORREO  VARCHAR(45),
  IN _TELEFONO  VARCHAR(45),
  IN _DIRECCION  VARCHAR(45),
  IN _GRADO  VARCHAR(45),
  IN _OBSERVACIONES  VARCHAR(45)
)
BEGIN 
  IF _ID = 0 THEN
    INSERT INTO alumnos ( ID_ALUMNO,NOMBRES,APELLIDOS,IDENTIFICACION,GENERO,CORREO,TELEFONO,DIRECCION, GRADO, OBSERVACIONES)
    VALUES (_ID_ALUMNO, _NOMBRES, _APELLIDOS ,_IDENTIFICACION ,_GENERO ,_CORREO ,_TELEFONO ,_DIRECCION ,_GRADO ,_OBSERVACIONES );

    SET _ID = LAST_INSERT_ID();
  ELSE
    UPDATE alumnos
    SET
     ID_ALUMNO =_ID_ALUMNO ,
     NOMBRES=  _NOMBRES,
     APELLIDOS = _APELLIDOS,
     IDENTIFICACION = _IDENTIFICACION ,
     GENERO = _GENERO ,
     CORREO = _CORREO,
     TELEFONO = _TELEFONO ,
     DIRECCION = _DIRECCION ,
     GRADO = _GRADO ,
     OBSERVACIONES=_OBSERVACIONES 
    WHERE ID = _ID;
  END IF;

  SELECT _ID AS 'ID';
END

--USUARIO

USE escuelawhatsapp;

DELIMITER $$
USE `escuelawhatsapp`$$

CREATE PROCEDURE `usuarioAddOrEdit` (
  IN _ID INT,
  IN _ID_USUARIO VARCHAR(45),
  IN _USER VARCHAR(45),
  IN _PASS VARCHAR(45),
  IN _ROL VARCHAR(45),
  IN _NOMBRE_USER VARCHAR(45),
  IN _TELEFONO VARCHAR(45),
  IN _CORREO VARCHAR(45)
)
BEGIN 
  IF _ID = 0 THEN
  INSERT INTO usuarios ( 
    ID_USUARIO,
    USER,
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO
  )
    VALUES (
    ID_USUARIO,
    USER,
    PASS,
    ROL,
    NOMBRE_USER,
    TELEFONO,
    CORREO
    );

    SET _ID = LAST_INSERT_ID();
  ELSE
    UPDATE usuarios
    SET
     ID_USUARIO =_ID_USUARIO ,
     USER=  _USER,
     PASS = _PASS,
     ROL = _ROL ,
     NOMBRE_USER = _NOMBRE_USER, 
     TELEFONO = _TELEFONO ,
     CORREO = _CORREO,
     ESTADO = _ESTADO 
    WHERE ID = _ID;
  END IF;

  SELECT _ID AS 'ID';
END