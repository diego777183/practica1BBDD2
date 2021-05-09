SELECT nombre, apellido1, apellido2 
FROM empleado

SELECT distinct e.dni, e.nombre, e.apellido1, e.apellido2 
FROM empleado e
WHERE e.dni NOT IN (SELECT dni
                       FROM investigador)

SELECT distinct d.dni, d.nombre, d.apellido1, d.apellido2 
FROM docente d
WHERE d.dni IN (SELECT dni
                       FROM investigador)

SELECT distinct e.dni, e.nombre, e.apellido1, e.apellido2 
FROM empleado e
WHERE e.apellido1 = 'Gracia'

SELECT a.nombreasignatura
FROM asignatura a
WHERE a.codasig IN (SELECT codasig
                    FROM imparte
                    GROUP BY codasig
                    HAVING count(dnidocente) >= 2)