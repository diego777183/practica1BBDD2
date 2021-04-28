(select l.nom_localidad, c.nom_estudio, max(c.indice_ocupacion)
from cursos c, centro cen, localidad l
where cen.nom_centro = c.nom_centro and l.id_localidad = cen.id_localidad and c.curso_academico = 2018 and
l.nom_localidad = 'Almunia de Doña Godina (La)'
group by l.nom_localidad, cen.nom_centro, c.nom_estudio
order by l.nom_localidad, max(c.indice_ocupacion) desc limit 2)

union
(select l.nom_localidad, c.nom_estudio, max(c.indice_ocupacion)
from cursos c, centro cen, localidad l
where cen.nom_centro = c.nom_centro and l.id_localidad = cen.id_localidad and c.curso_academico = 2018 and
l.nom_localidad = 'Huesca'
group by l.nom_localidad, cen.nom_centro, c.nom_estudio
order by l.nom_localidad, max(c.indice_ocupacion) desc limit 2)

union 

(select l.nom_localidad, c.nom_estudio, max(c.indice_ocupacion)
from cursos c, centro cen, localidad l
where cen.nom_centro = c.nom_centro and l.id_localidad = cen.id_localidad and c.curso_academico = 2018 and
l.nom_localidad = 'Teruel'
group by l.nom_localidad, cen.nom_centro, c.nom_estudio
order by l.nom_localidad, max(c.indice_ocupacion) desc limit 2)

union

(select l.nom_localidad, c.nom_estudio, max(c.indice_ocupacion)
from cursos c, centro cen, localidad l
where cen.nom_centro = c.nom_centro and l.id_localidad = cen.id_localidad and c.curso_academico = 2018 and
l.nom_localidad = 'Zaragoza'
group by l.nom_localidad, cen.nom_centro, c.nom_estudio
order by l.nom_localidad, max(c.indice_ocupacion) desc limit 2)




select distinct plazas.nom_universidad, SUM(plazas.plazas_asignadas)
from(
select  u.nom_universidad, t.plazas_asignadas
from tieneConvenioMovilidad t, universidadMovilidad u
where anyo = 2019 and u.id_universidad = t.id_universidad) as plazas
group by plazas.nom_universidad
order by SUM(plazas.plazas_asignadas) desc limit 0,1