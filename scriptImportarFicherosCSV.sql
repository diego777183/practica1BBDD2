create table if not exists alumnosEgresados(
    curso_academico int,
    localidad varchar(100),
    estudio varchar(100),
    tipo_estudio varchar(100),
    tipo_egreso varchar(100),
    sexo varchar(100),
    alumnos_graduados int,
    alumnos_interrumpen_estudios int,
    alumnos_interrumpen_est_ano1 int,
    alumnos_trasladan_otra_univ int,
    duracion_media_graduados double,
    tasa_eficiencia double,
    fecha_actualizacion date
);

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres19.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, @duracion_media_graduados, @tasa_eficiencia, @fecha_actualizacion)
SET duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres18.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, @duracion_media_graduados, @tasa_eficiencia, @fecha_actualizacion)
SET duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres17.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso, sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, @duracion_media_graduados, @tasa_eficiencia, @fecha_actualizacion)
SET duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');



create table if not exists plazasOfertadas(
    curso_academico int,
    estudio varchar(200),
    localidad varchar(100),
    centro varchar(100),
    tipo_centro varchar(100),
    tipo_estudio varchar(100),
    plazas_ofertadas int,
    plazas_matriculadas int,
    plazas_solicitadas int,
    indice_ocupacion double,
    fecha_actualizacion date
);

LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas19.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, @indice_ocupacion, @fecha_actualizacion)
SET indice_ocupacion = IF(@indice_ocupacion = '', 0, @indice_ocupacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');


LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas18.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, @indice_ocupacion, @fecha_actualizacion)
SET indice_ocupacion = IF(@indice_ocupacion = '', 0, @indice_ocupacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');


LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas17.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, @indice_ocupacion, @fecha_actualizacion)
SET indice_ocupacion = IF(@indice_ocupacion = '', 0, @indice_ocupacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

create table if not exists resultadosTitulaciones(
    curso_academico int,
    centro varchar(100),
    estudio varchar(200),
    tipo_estudio varchar(100),
    alumnos_matriculados int,
    alumnos_nuevo_ingreso int,
    plazas_ofertadas int,
    alumnos_graduados int,
    alumnos_adapta_grado_matri int,
    alumnos_adapta_grado_matri_ni int,
    alumnos_adapta_grado_titulado int,
    alumnos_con_reconocimiento int,
    alumnos_movilidad_entrada int,
    alumnos_movilidad_salida int,
    creditos_matriculados double,
    creditos_reconocidos double,
    duracion_media_graduados double,
    tasa_exito double,
    tasa_rendimiento double,
    tasa_eficiencia double,
    tasa_abandono double,
    tasa_graduacion double,
    fecha_actualizacion date
);

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu19.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, centro, estudio, tipo_estudio, @alumnos_matriculados, @alumnos_nuevo_ingreso, @plazas_ofertadas, @alumnos_graduados, @alumnos_adapta_grado_matri, @alumnos_adapta_grado_matri_ni, @alumnos_adapta_grado_titulado, @alumnos_con_reconocimiento, @alumnos_movilidad_entrada, @alumnos_movilidad_salida, @creditos_matriculados, @creditos_reconocidos, @duracion_media_graduados, @tasa_exito, @tasa_rendimiento, @tasa_eficiencia, @tasa_abandono, @tasa_graduacion, @fecha_actualizacion)
SET estudio = REGEXP_REPLACE(estudio, '[0-9]+-',''),
    alumnos_matriculados = IF(@alumnos_matriculados = '', 0, @alumnos_matriculados),
    alumnos_nuevo_ingreso = IF(@alumnos_nuevo_ingreso = '', 0, @alumnos_nuevo_ingreso),
    plazas_ofertadas = IF(@plazas_ofertadas = '', 0, @plazas_ofertadas),
    alumnos_graduados = IF(@alumnos_graduados = '', 0, @alumnos_graduados),
    alumnos_adapta_grado_matri = IF(@alumnos_adapta_grado_matri = '', 0, @alumnos_adapta_grado_matri),
    alumnos_adapta_grado_matri_ni = IF(@alumnos_adapta_grado_matri_ni = '', 0, @alumnos_adapta_grado_matri_ni),
    alumnos_adapta_grado_titulado = IF(@alumnos_adapta_grado_titulado = '', 0, @alumnos_adapta_grado_titulado),
    alumnos_con_reconocimiento = IF(@alumnos_con_reconocimiento = '', 0, @alumnos_con_reconocimiento),
    alumnos_movilidad_entrada = IF(@alumnos_movilidad_entrada = '', 0, @alumnos_movilidad_entrada),
    alumnos_movilidad_salida = IF(@alumnos_movilidad_salida = '', 0, @alumnos_movilidad_salida),
    creditos_matriculados = IF(@creditos_matriculados = '', 0, @creditos_matriculados),
    creditos_reconocidos = IF(@creditos_reconocidos = '', 0, @creditos_reconocidos),
    duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_exito = IF(@tasa_exito = '', 0, @tasa_exito),
    tasa_rendimiento = IF(@tasa_rendimiento = '', 0, @tasa_rendimiento),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    tasa_abandono = IF(@tasa_abandono = '', 0, @tasa_abandono),
    tasa_graduacion = IF(@tasa_graduacion = '', 0, @tasa_graduacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu18.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, centro, estudio, tipo_estudio, @alumnos_matriculados, @alumnos_nuevo_ingreso, @plazas_ofertadas, @alumnos_graduados, @alumnos_adapta_grado_matri, @alumnos_adapta_grado_matri_ni, @alumnos_adapta_grado_titulado, @alumnos_con_reconocimiento, @alumnos_movilidad_entrada, @alumnos_movilidad_salida, @creditos_matriculados, @creditos_reconocidos, @duracion_media_graduados, @tasa_exito, @tasa_rendimiento, @tasa_eficiencia, @tasa_abandono, @tasa_graduacion, @fecha_actualizacion)
SET estudio = REGEXP_REPLACE(estudio, '[0-9]+-',''),
    alumnos_matriculados = IF(@alumnos_matriculados = '', 0, @alumnos_matriculados),
    alumnos_nuevo_ingreso = IF(@alumnos_nuevo_ingreso = '', 0, @alumnos_nuevo_ingreso),
    plazas_ofertadas = IF(@plazas_ofertadas = '', 0, @plazas_ofertadas),
    alumnos_graduados = IF(@alumnos_graduados = '', 0, @alumnos_graduados),
    alumnos_adapta_grado_matri = IF(@alumnos_adapta_grado_matri = '', 0, @alumnos_adapta_grado_matri),
    alumnos_adapta_grado_matri_ni = IF(@alumnos_adapta_grado_matri_ni = '', 0, @alumnos_adapta_grado_matri_ni),
    alumnos_adapta_grado_titulado = IF(@alumnos_adapta_grado_titulado = '', 0, @alumnos_adapta_grado_titulado),
    alumnos_con_reconocimiento = IF(@alumnos_con_reconocimiento = '', 0, @alumnos_con_reconocimiento),
    alumnos_movilidad_entrada = IF(@alumnos_movilidad_entrada = '', 0, @alumnos_movilidad_entrada),
    alumnos_movilidad_salida = IF(@alumnos_movilidad_salida = '', 0, @alumnos_movilidad_salida),
    creditos_matriculados = IF(@creditos_matriculados = '', 0, @creditos_matriculados),
    creditos_reconocidos = IF(@creditos_reconocidos = '', 0, @creditos_reconocidos),
    duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_exito = IF(@tasa_exito = '', 0, @tasa_exito),
    tasa_rendimiento = IF(@tasa_rendimiento = '', 0, @tasa_rendimiento),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    tasa_abandono = IF(@tasa_abandono = '', 0, @tasa_abandono),
    tasa_graduacion = IF(@tasa_graduacion = '', 0, @tasa_graduacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu17.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, centro, estudio, tipo_estudio, @alumnos_matriculados, @alumnos_nuevo_ingreso, @plazas_ofertadas, @alumnos_graduados, @alumnos_adapta_grado_matri, @alumnos_adapta_grado_matri_ni, @alumnos_adapta_grado_titulado, @alumnos_con_reconocimiento, @alumnos_movilidad_entrada, @alumnos_movilidad_salida, @creditos_matriculados, @creditos_reconocidos, @duracion_media_graduados, @tasa_exito, @tasa_rendimiento, @tasa_eficiencia, @tasa_abandono, @tasa_graduacion, @fecha_actualizacion)
SET estudio = REGEXP_REPLACE(estudio, '[0-9]+-',''),
    alumnos_matriculados = IF(@alumnos_matriculados = '', 0, @alumnos_matriculados),
    alumnos_nuevo_ingreso = IF(@alumnos_nuevo_ingreso = '', 0, @alumnos_nuevo_ingreso),
    plazas_ofertadas = IF(@plazas_ofertadas = '', 0, @plazas_ofertadas),
    alumnos_graduados = IF(@alumnos_graduados = '', 0, @alumnos_graduados),
    alumnos_adapta_grado_matri = IF(@alumnos_adapta_grado_matri = '', 0, @alumnos_adapta_grado_matri),
    alumnos_adapta_grado_matri_ni = IF(@alumnos_adapta_grado_matri_ni = '', 0, @alumnos_adapta_grado_matri_ni),
    alumnos_adapta_grado_titulado = IF(@alumnos_adapta_grado_titulado = '', 0, @alumnos_adapta_grado_titulado),
    alumnos_con_reconocimiento = IF(@alumnos_con_reconocimiento = '', 0, @alumnos_con_reconocimiento),
    alumnos_movilidad_entrada = IF(@alumnos_movilidad_entrada = '', 0, @alumnos_movilidad_entrada),
    alumnos_movilidad_salida = IF(@alumnos_movilidad_salida = '', 0, @alumnos_movilidad_salida),
    creditos_matriculados = IF(@creditos_matriculados = '', 0, @creditos_matriculados),
    creditos_reconocidos = IF(@creditos_reconocidos = '', 0, @creditos_reconocidos),
    duracion_media_graduados = IF(@duracion_media_graduados = '', 0, @duracion_media_graduados),
    tasa_exito = IF(@tasa_exito = '', 0, @tasa_exito),
    tasa_rendimiento = IF(@tasa_rendimiento = '', 0, @tasa_rendimiento),
    tasa_eficiencia = IF(@tasa_eficiencia = '', 0, @tasa_eficiencia),
    tasa_abandono = IF(@tasa_abandono = '', 0, @tasa_abandono),
    tasa_graduacion = IF(@tasa_graduacion = '', 0, @tasa_graduacion),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

create table if not exists acuerdosMovilidad(
    curso_academico int,
    nombre_programa_movilidad varchar(100),
    nombre_area_estudios_mov varchar(100),
    centro varchar(100),
    in_out varchar(10),
    nombre_idioma_nivel_movilidad varchar(100),
    pais_universidad_acuerdo varchar(100),
    universidad_acuerdo varchar(100),
    plazas_ofertadas_alumnos int,
    plazas_asignadas_alumnos_out int,
    fecha_actualizacion date
);

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov19.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y'),
    nombre_area_estudios_mov = REGEXP_REPLACE(nombre_area_estudios_mov, '[0-9]+[-]','');

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov18.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y'),
nombre_area_estudios_mov = REGEXP_REPLACE(nombre_area_estudios_mov, '[0-9]+[-]','');

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov17.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y'),
nombre_area_estudios_mov = REGEXP_REPLACE(nombre_area_estudios_mov, '[0-9]+[-]','');

create table if not exists notasCorte(
    curso_academico int,
    estudio varchar(120),
    localidad varchar(100),
    centro varchar(100),
    prela_convo_nota_def double,
    nota_corte_definitiva_julio double,
    nota_corte_definitiva_septiembre double,
    fecha_actualizacion date
);

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte19.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, @prela_convo_nota_def, @nota_corte_definitiva_julio, @nota_corte_definitiva_septiembre, @fecha_actualizacion)
SET prela_convo_nota_def = IF(@prela_convo_nota_def = '', 0, @prela_convo_nota_def),
    nota_corte_definitiva_julio = IF(@nota_corte_definitiva_julio = '', 0, @nota_corte_definitiva_julio),
    nota_corte_definitiva_septiembre = IF(@nota_corte_definitiva_septiembre = '', 0, @nota_corte_definitiva_septiembre),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte18.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, @prela_convo_nota_def, @nota_corte_definitiva_julio, @nota_corte_definitiva_septiembre, @fecha_actualizacion)
SET prela_convo_nota_def = IF(@prela_convo_nota_def = '', 0, @prela_convo_nota_def),
    nota_corte_definitiva_julio = IF(@nota_corte_definitiva_julio = '', 0, @nota_corte_definitiva_julio),
    nota_corte_definitiva_septiembre = IF(@nota_corte_definitiva_septiembre = '', 0, @nota_corte_definitiva_septiembre),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte17.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(curso_academico, estudio, localidad, centro, @prela_convo_nota_def, @nota_corte_definitiva_julio, @nota_corte_definitiva_septiembre, @fecha_actualizacion)
SET prela_convo_nota_def = IF(@prela_convo_nota_def = '', 0, @prela_convo_nota_def),
    nota_corte_definitiva_julio = IF(@nota_corte_definitiva_julio = '', 0, @nota_corte_definitiva_julio),
    nota_corte_definitiva_septiembre = IF(@nota_corte_definitiva_septiembre = '', 0, @nota_corte_definitiva_septiembre),
    fecha_actualizacion = STR_TO_DATE(REPLACE(@fecha_actualizacion, "/", "-"), '%d-%m-%Y');