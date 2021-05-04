COPY alumnosEgresados
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo,
alumnos_graduados, alumnos_interrumpen_estudios, 
alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, 
duracion_media_graduados, tasa_eficiencia, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/alumnEgres19.csv'
DELIMITER ';' CSV HEADER;

COPY alumnosEgresados
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo,
alumnos_graduados, alumnos_interrumpen_estudios, 
alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, 
duracion_media_graduados, tasa_eficiencia, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/alumnEgres18.csv'
DELIMITER ';' CSV HEADER;

COPY alumnosEgresados
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo,
alumnos_graduados, alumnos_interrumpen_estudios, 
alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, 
duracion_media_graduados, tasa_eficiencia, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/alumnEgres17.csv'
DELIMITER ';' CSV HEADER;

delete from alumnosEgresados
where tipo_estudio != 'Grado: ';



COPY plazasofertadas(curso_academico, estudio, localidad,
centro, tipo_centro, tipo_estudio, plazas_ofertadas,
plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/oferPlazas19.csv'
DELIMITER ';' CSV HEADER;

COPY plazasofertadas(curso_academico, estudio, localidad,
centro, tipo_centro, tipo_estudio, plazas_ofertadas,
plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/oferPlazas18.csv'
DELIMITER ';' CSV HEADER;

COPY plazasofertadas(curso_academico, estudio, localidad,
centro, tipo_centro, tipo_estudio, plazas_ofertadas,
plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/oferPlazas17.csv'
DELIMITER ';' CSV HEADER;

update plazasOfertadas
SET estudio = regexp_replace(estudio, 'Grado: ','');

delete from plazasofertadas
where tipo_estudio != 'Grado';



COPY resultadosTitulaciones(curso_academico, centro, estudio, tipo_estudio,
alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas,
alumnos_graduados, alumnos_adapta_grado_matri, 
alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, 
alumnos_con_reconocimiento, alumnos_movilidad_entrada, 
alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, 
duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, 
tasa_abandono, tasa_graduacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/resulTitu19.csv'
DELIMITER ';' CSV HEADER;

COPY resultadosTitulaciones(curso_academico, centro, estudio, tipo_estudio,
alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas,
alumnos_graduados, alumnos_adapta_grado_matri, 
alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, 
alumnos_con_reconocimiento, alumnos_movilidad_entrada, 
alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, 
duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, 
tasa_abandono, tasa_graduacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/resulTitu18.csv'
DELIMITER ';' CSV HEADER;

COPY resultadosTitulaciones(curso_academico, centro, estudio, tipo_estudio,
alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas,
alumnos_graduados, alumnos_adapta_grado_matri, 
alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, 
alumnos_con_reconocimiento, alumnos_movilidad_entrada, 
alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, 
duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, 
tasa_abandono, tasa_graduacion, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/resulTitu17.csv'
DELIMITER ';' CSV HEADER;
 

update resultadosTitulaciones
SET estudio = regexp_replace(estudio, '[0-9]+-',''),
    alumnos_matriculados = IF(alumnos_matriculados = '', 0, alumnos_matriculados),
    alumnos_nuevo_ingreso = IF(alumnos_nuevo_ingreso = '', 0, alumnos_nuevo_ingreso),
    plazas_ofertadas = IF(plazas_ofertadas = '', 0, plazas_ofertadas),
    alumnos_graduados = IF(alumnos_graduados = '', 0, alumnos_graduados),
    alumnos_adapta_grado_matri = IF(alumnos_adapta_grado_matri = '', 0, alumnos_adapta_grado_matri),
    alumnos_adapta_grado_matri_ni = IF(alumnos_adapta_grado_matri_ni = '', 0, alumnos_adapta_grado_matri_ni),
    alumnos_adapta_grado_titulado = IF(alumnos_adapta_grado_titulado = '', 0, alumnos_adapta_grado_titulado),
    alumnos_con_reconocimiento = IF(alumnos_con_reconocimiento = '', 0, alumnos_con_reconocimiento),
    alumnos_movilidad_entrada = IF(alumnos_movilidad_entrada = '', 0, alumnos_movilidad_entrada),
    alumnos_movilidad_salida = IF(alumnos_movilidad_salida = '', 0, alumnos_movilidad_salida),
    creditos_matriculados = IF(creditos_matriculados = '', 0, creditos_matriculados),
    creditos_reconocidos = IF(creditos_reconocidos = '', 0, creditos_reconocidos),
    duracion_media_graduados = IF(duracion_media_graduados = '', 0, duracion_media_graduados),
    tasa_exito = IF(tasa_exito = '', 0, tasa_exito),
    tasa_rendimiento = IF(tasa_rendimiento = '', 0, tasa_rendimiento),
    tasa_eficiencia = IF(tasa_eficiencia = '', 0, tasa_eficiencia),
    tasa_abandono = IF(tasa_abandono = '', 0, tasa_abandono),
    tasa_graduacion = IF(tasa_graduacion = '', 0, tasa_graduacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(fecha_actualizacion, "/", "-"), '%d-%m-%Y');

delete from resultadosTitulaciones
where tipo_estudio != 'Grado';



COPY acuerdosMovilidad(curso_academico, nombre_programa_movilidad, 
nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, 
pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, 
plazas_asignadas_alumnos_out, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/acuerdosMov19.csv'
DELIMITER ';' CSV HEADER;

COPY acuerdosMovilidad(curso_academico, nombre_programa_movilidad, 
nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, 
pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, 
plazas_asignadas_alumnos_out, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/acuerdosMov18.csv'
DELIMITER ';' CSV HEADER;

COPY acuerdosMovilidad(curso_academico, nombre_programa_movilidad, 
nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, 
pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, 
plazas_asignadas_alumnos_out, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/acuerdosMov17.csv'
DELIMITER ';' CSV HEADER;

update acuerdosMovilidad
set nombre_area_estudios_mov = REGEXP_REPLACE(nombre_area_estudios_mov, '[0-9]+[-]','');



COPY notasCorte(curso_academico, estudio, localidad, centro, 
prela_convo_nota_def, nota_corte_definitiva_julio, 
nota_corte_definitiva_septiembre, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/notasCorte19.csv'
DELIMITER ';' CSV HEADER;

COPY notasCorte(curso_academico, estudio, localidad, centro, 
prela_convo_nota_def, nota_corte_definitiva_julio, 
nota_corte_definitiva_septiembre, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/notasCorte18.csv'
DELIMITER ';' CSV HEADER;

COPY notasCorte(curso_academico, estudio, localidad, centro, 
prela_convo_nota_def, nota_corte_definitiva_julio, 
nota_corte_definitiva_septiembre, fecha_actualizacion)
FROM '/home/alumno/practica1BBDD2/ficheros/notasCorte17.csv'
DELIMITER ';' CSV HEADER;

update notasCorte
SET estudio = REGEXP_REPLACE(estudio, 'Grado: ','');