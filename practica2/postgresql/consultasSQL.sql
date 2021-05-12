/*Seleccionar todos los empleados*/
SELECT nombre, apellido1, apellido2 
FROM empleado

/*Seleccionar sólo los empleados docentes que no sean
investigadores*/
SELECT distinct e.dni, e.nombre, e.apellido1, e.apellido2 
FROM empleado e
WHERE e.dni NOT IN (SELECT dni
                       FROM investigador)

/*Seleccionar los docentes que sea docentes e investigadores*/
SELECT distinct d.dni, d.nombre, d.apellido1, d.apellido2 
FROM docente d
WHERE d.dni IN (SELECT dni
                       FROM investigador)

/*Mostrar todos los empleados cuyo primer apellido sea
“Gracia”.*/
SELECT distinct e.dni, e.nombre, e.apellido1, e.apellido2 
FROM empleado e
WHERE e.apellido1 = 'Gracia'

/*Seleccionar todas las asignaturas impartidas por dos
profesores o más (JOIN + herencia + agrupación + contar)*/
SELECT a.nombreasignatura
FROM asignatura a
WHERE a.codasig IN (SELECT codasig
                    FROM imparte
                    GROUP BY codasig
                    HAVING count(dnidocente) >= 2)

/*Tabla en la que se muestre empleado y carga de trabajo. La
carga es la suma de asignaturas y proyectos*/
INSERT INTO tabla_carga(dni, carga)
(SELECT sumadoc.dnidocente, (sumadoc.totaldoc+sumainv.totalinv)
FROM (SELECT i.dnidocente, count(*) as totaldoc
      FROM imparte i
      GROUP BY i.dnidocente) as sumadoc,
      (SELECT p.dniinvestigador, count(*) as totalinv
      FROM participa p
      GROUP BY p.dniinvestigador) as sumainv
WHERE sumadoc.dnidocente = sumainv.dniinvestigador

UNION(

SELECT i.dnidocente, count(*)
FROM imparte i
WHERE i.dnidocente NOT IN (SELECT DISTINCT p.dniinvestigador FROM participa p)
GROUP BY i.dnidocente

UNION 

SELECT p.dniinvestigador, count(*)
FROM participa p
WHERE p.dniinvestigador NOT IN (SELECT DISTINCT i.dnidocente FROM imparte i)
GROUP BY p.dniinvestigador)