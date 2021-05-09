CREATE TABLE asignatura(
   codAsig NUMBER(9),
   nombreAsignatura VARCHAR2(100),
   PRIMARY KEY(codAsig)
);

CREATE TABLE proyectoInvestigador(
   refProyecto NUMBER(9),
   titulo VARCHAR2(100),
   fechaFinal VARCHAR2(100),
   fechaInicio VARCHAR2(100),
   PRIMARY KEY(refProyecto)
);

CREATE TYPE tipoEmpleado AS OBJECT
    (dni VARCHAR2(9),
    nombre VARCHAR2(25),
    apellido1 VARCHAR2(100),
    apellido2 VARCHAR2(100))
    NOT INSTANTIABLE NOT FINAL;

CREATE TABLE empleado OF tipoEmpleado(
    PRIMARY KEY(dni)
);

CREATE TYPE tipoDocente UNDER tipoEmpleado
    (puestoDocente VARCHAR2(100))
    NOT INSTANTIABLE NOT FINAL;

CREATE TABLE docente OF tipoDocente (
    PRIMARY KEY (dni)
);

CREATE TYPE tipoInvestigador UNDER tipoEmpleado
    (crcid VARCHAR2(100))
    NOT INSTANTIABLE NOT FINAL;

CREATE TABLE investigador OF tipoInvestigador (
    PRIMARY KEY (dni)
);

CREATE TABLE imparte(
    codAsig NUMBER(38) not null,
    dniDocente VARCHAR2(100),
    primary key(codAsig, dniDocente),
    foreign key(codAsig) references asignatura(codAsig),
    foreign key(dniDocente) references docente(dni)
);

CREATE TABLE participa(
    refProyecto NUMBER(38) not null,
    dniInvestigador VARCHAR2(100) not null,
    primary key(refProyecto, dniInvestigador),
    foreign key(refProyecto) references proyectoInvestigador(refProyecto),
    foreign key(dniInvestigador) references investigador(dni)
);