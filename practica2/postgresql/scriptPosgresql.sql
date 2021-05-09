CREATE TABLE IF NOT EXISTS asignatura(
    codAsig integer primary key not null,
    nombreAsignatura text not null
);

CREATE TABLE IF NOT EXISTS proyectoInvestigador(
    refProyecto integer primary key not null,
    titulo text not null,
    fechaFinal text,
    fechaInicio text
);

CREATE TABLE IF NOT EXISTS empleado(
    dni text primary key not null,
    nombre text not null,
    apellido1 text not null,
    apellido2 text not null
);

CREATE TABLE IF NOT EXISTS docente(
    primary key(dni),
    puestoDocente text not null
)INHERITS (empleado);

CREATE TABLE IF NOT EXISTS investigador(
    primary key(dni),
    crcid text not null
)INHERITS (empleado);

CREATE TABLE IF NOT EXISTS imparte(
    codAsig integer not null,
    dniDocente text not null,
    primary key(codAsig, dniDocente),
    foreign key(codAsig) references asignatura(codAsig),
    foreign key(dniDocente) references docente(dni)
);

CREATE TABLE IF NOT EXISTS participa(
    refProyecto integer not null,
    dniInvestigador text not null,
    primary key(refProyecto, dniInvestigador),
    foreign key(refProyecto) references proyectoInvestigador(refProyecto),
    foreign key(dniInvestigador) references investigador(dni)
);


