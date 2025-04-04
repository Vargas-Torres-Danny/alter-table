CREATE TABLE ESTUDIANTES (
    ID_ESTUDIANTE INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    APELLIDO VARCHAR(100),
    EMAIL VARCHAR(100) UNIQUE,
    FECHA_NACIMIENTO DATE
);

CREATE TABLE CURSOS (
    ID_CURSO INT PRIMARY KEY,
    NOMBRE_CURSO VARCHAR(100),
    DESCRIPCION VARCHAR(255),
    DURACION DECIMAL(5,1), -- Modificado para permitir decimales
    PRECIO DECIMAL(10,2)
);

CREATE TABLE INSCRIPCIONES (
    ID_INSCRIPCION INT PRIMARY KEY,
    ID_ESTUDIANTE INT,
    ID_CURSO INT,
    FECHA_INSCRIPCION DATE NOT NULL, -- Se agreg� la restricci�n NOT NULL correctamente
    CALIFICACION DECIMAL(5,2),
    CONSTRAINT FK_ESTUDIANTE FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTES(ID_ESTUDIANTE),
    CONSTRAINT FK_CURSO FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSO)
);

-- 1. Agregar una columna a ESTUDIANTES
ALTER TABLE ESTUDIANTES ADD DIRECCION VARCHAR(200);

-- 2. Modificar el tipo de datos en CURSOS
ALTER TABLE CURSOS ALTER COLUMN DURACION DECIMAL(5,1);

-- 3. Asegurar que FECHA_INSCRIPCION sea NOT NULL
ALTER TABLE INSCRIPCIONES ALTER COLUMN FECHA_INSCRIPCION DATE NOT NULL;

-- 4. Agregar una restricci�n UNIQUE a CURSOS
ALTER TABLE CURSOS ADD CONSTRAINT UQ_NOMBRE_CURSO UNIQUE (NOMBRE_CURSO);

-- 5. Agregar una restricci�n CHECK a ESTUDIANTES para asegurar que los estudiantes tengan al menos 16 a�os
ALTER TABLE ESTUDIANTES ADD CONSTRAINT CK_FECHA_NACIMIENTO CHECK (
    FECHA_NACIMIENTO <= DATEADD(YEAR, -16, GETDATE())
);

-- 6. Modificar una clave for�nea en INSCRIPCIONES
ALTER TABLE INSCRIPCIONES DROP CONSTRAINT FK_ESTUDIANTE;
ALTER TABLE INSCRIPCIONES ADD CONSTRAINT FK_ESTUDIANTE FOREIGN KEY (ID_ESTUDIANTE) 
REFERENCES ESTUDIANTES(ID_ESTUDIANTE) ON UPDATE CASCADE;

-- 7. Modificar una restricci�n existente en CURSOS (CHECK en PRECIO)
ALTER TABLE CURSOS ADD CONSTRAINT CK_PRECIO CHECK (PRECIO >= 0);

-- 8. Eliminar la columna FECHA_NACIMIENTO en ESTUDIANTES
ALTER TABLE ESTUDIANTES DROP COLUMN FECHA_NACIMIENTO;

-- 9. Cambiar el nombre de la columna CALIFICACION a PUNTUACION en INSCRIPCIONES
EXEC sp_rename 'INSCRIPCIONES.CALIFICACION', 'PUNTUACION', 'COLUMN';

-- 10. Deshabilitar y habilitar la restricci�n UNIQUE en CURSOS
ALTER TABLE CURSOS NOCHECK CONSTRAINT UQ_NOMBRE_CURSO; -- Deshabilitar
ALTER TABLE CURSOS CHECK CONSTRAINT UQ_NOMBRE_CURSO;   -- Habilitar


