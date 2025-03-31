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
    DURACION INT, -- Duraci�n en horas
    PRECIO DECIMAL(10,2)
);

CREATE TABLE INSCRIPCIONES (
    ID_INSCRIPCION INT PRIMARY KEY,
    ID_ESTUDIANTE INT,
    ID_CURSO INT,
    FECHA_INSCRIPCION DATE,
    CALIFICACION DECIMAL(5,2), -- Permite valores decimales en calificaciones
    CONSTRAINT FK_ESTUDIANTE FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTES(ID_ESTUDIANTE),
    CONSTRAINT FK_CURSO FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSO)
);

-- 1. Agregar una columna a ESTUDIANTES
ALTER TABLE ESTUDIANTES ADD DIRECCION VARCHAR2(200);

-- 2. Modificar el tipo de datos en CURSOS
ALTER TABLE CURSOS MODIFY DURACION NUMBER(5,1);

-- 3. Agregar una restricci�n NOT NULL a INSCRIPCIONES
ALTER TABLE INSCRIPCIONES MODIFY FECHA_INSCRIPCION CONSTRAINT NN_FECHA_INSCRIPCION NOT NULL;

-- 4. Agregar una restricci�n UNIQUE a CURSOS
ALTER TABLE CURSOS ADD CONSTRAINT UQ_NOMBRE_CURSO UNIQUE (NOMBRE_CURSO);

-- 5. Agregar una restricci�n CHECK a ESTUDIANTES para asegurar que los estudiantes tengan al menos 16 a�os
ALTER TABLE ESTUDIANTES ADD CONSTRAINT CK_FECHA_NACIMIENTO CHECK (
    FECHA_NACIMIENTO <= ADD_MONTHS(SYSDATE, -192)
);
