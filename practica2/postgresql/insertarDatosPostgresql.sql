INSERT INTO asignatura(codasig, nombreasignatura)
VALUES(1,'bases de datos 1');

INSERT INTO asignatura(codasig, nombreasignatura)
VALUES(2,'bases de datos 2');

INSERT INTO asignatura(codasig, nombreasignatura)
VALUES(3,'bases de datos 3');

INSERT INTO asignatura(codasig, nombreasignatura)
VALUES(4,'bases de datos 4');

INSERT INTO asignatura(codasig, nombreasignatura)
VALUES(5,'bases de datos 5');

INSERT INTO empleado(dni, nombre, apellido1, apellido2)
VALUES('11111111J', 'diego', 'santome', 'rocafort');

INSERT INTO empleado(dni, nombre, apellido1, apellido2)
VALUES('22222222J', 'alberto', 'serna', 'perez');

INSERT INTO docente(dni, nombre, apellido1, apellido2, puestodocente)
VALUES('333333333J', 'alberto', 'perez', 'blasco', 'directorDocente');

INSERT INTO docente(dni, nombre, apellido1, apellido2, puestodocente)
VALUES('44444444J', 'roberto', 'jimenez', 'lopez', 'directorDocente2');

INSERT INTO investigador(dni, nombre, apellido1, apellido2, crcid)
VALUES('55555555J', 'fernando', 'revilla', 'maqueda', '123');

INSERT INTO investigador(dni, nombre, apellido1, apellido2, crcid)
VALUES('66666666J', 'julia', 'rodrigo', 'noMeSeEsteApellido', '456');

INSERT INTO proyectoinvestigador(refProyecto, titulo, fechafinal, fechainicio)
VALUES(1, 'Proyecto 1', '9/5/2021', '15/5/2021');

INSERT INTO proyectoinvestigador(refProyecto, titulo, fechafinal, fechainicio)
VALUES(2, 'Proyecto 2', '9/5/2021', '15/5/2021');

INSERT INTO proyectoinvestigador(refProyecto, titulo, fechafinal, fechainicio)
VALUES(3, 'Proyecto 3', '9/5/2021', '15/5/2021');

INSERT INTO proyectoinvestigador(refProyecto, titulo, fechafinal, fechainicio)
VALUES(4, 'Proyecto 4', '9/5/2021', '15/5/2021');

INSERT INTO proyectoinvestigador(refProyecto, titulo, fechafinal, fechainicio)
VALUES(5, 'Proyecto 5', '9/5/2021', '15/5/2021');

INSERT INTO imparte(codasig, dnidocente)
SELECT distinct a.codasig, d.dni 
FROM asignatura a, docente d;

INSERT INTO participa(refproyecto, dniinvestigador)
SELECT distinct p.refproyecto, i.dni 
FROM proyectoinvestigador p, investigador i;

