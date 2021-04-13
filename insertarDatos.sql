insert into tipo_centro(nom_centro)
select distinct tipo_centro from plazasOfertadas

insert into tipo_estudio(nom_estudio)
select distinct tipo_estudio from resultadosTitulaciones 

insert into localidad(nom_localidad)
select distinct localidad from alumnosEgresados 

insert into centro(nom_centro, id_tipo_centro, id_localidad)
select distinct plaOfer.centro, c.id_tipo_centro, l.id_localidad 
from plazasOfertadas plaOfer, tipo_centro c, localidad l
where c.nom_centro = plaOfer.tipo_centro and l.nom_localidad = plaOfer.localidad

/*TODO tengo que quitar el campo alumnos de la tabla de centro y rehacer las consultas y tal

