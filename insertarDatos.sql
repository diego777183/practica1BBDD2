insert into tipo_centro(nom_centro)
select distinct tipo_centro from plazasOfertadas 

insert into localidad(nom_localidad)
select distinct localidad from alumnosEgresados 

insert into centro(nom_centro, id_tipo_centro, id_localidad)
select distinct plaOfer.centro, c.id_tipo_centro, l.id_localidad 
from plazasOfertadas plaOfer, tipo_centro c, localidad l
where c.nom_centro = plaOfer.tipo_centro and l.nom_localidad = plaOfer.localidad

insert into estudios(nom_estudio)
select distinct plaOfer.estudio
from plazasOfertadas plaOfer

insert into imparte(nom_centro, nom_estudio)
select c.nom_centro, e.nom_estudio
from estudios e, centro c
where e.nom_estudio IN (SELECT plaOfer.estudio from plazasOfertadas plaOfer where plaOfer.centro = c.nom_centro)

insert into imparte (nom_centro, nom_estudio)
select distinct centro, estudio
from plazasOfertadas 

/* no se cual usar de las dos de arriba*/

insert into plazas(nom_centro, nom_estudio, curso_academico, plazas_matriculadas, plazas_ofertadas, plazas_solicitadas, indice_ocupacion)
select distinct plaOfer.centro, plaOfer.estudio, plaOfer.curso_academico, plaOfer.plazas_matriculadas, plaOfer.plazas_ofertadas, plaOfer.plazas_solicitadas, plaOfer.indice_ocupacion
from plazasOfertadas plaOfer


insert into resultados(nom_centro, nom_estudio, curso_academico, alumnos_graduados, tasa_abandono, tasa_eficiencia, tasa_exito, tasa_graduados, alumnos_matriculados, alumnos_nuevos)
select distinct r.centro, r.estudio, r.curso_academico, r.alumnos_graduados, r.tasa_abandono, r.tasa_eficiencia, r.tasa_exito, r.tasa_graduacion, r.alumnos_matriculados, r.alumnos_nuevo_ingreso
from resultadosTitulaciones r




