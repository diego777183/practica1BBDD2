create table if not exists alumnosEgresados(
    CURSO_ACADEMICO int,
    LOCALIDAD varchar(100),
    ESTUDIO varchar(100),
    TIPO_ESTUDIO varchar(100),
    TIPO_EGRESO varchar(100),
    SEXO varchar(100),
    ALUMNOS_GRADUADOS int,
    ALUMNOS_INTERRUMPEN_ESTUDIOS int,
    ALUMNOS_INTERRUMPEN_EST_ANO1 int,
    ALUMNOS_TRASLADAN_OTRA_UNIV int,
    DURACION_MEDIA_GRADUADOS double,
    TASA_EFICIENCIA double,
    FECHA_ACTUALIZACION date
);

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres19.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, LOCALIDAD, ESTUDIO, TIPO_ESTUDIO, TIPO_EGRESO, SEXO, ALUMNOS_GRADUADOS, ALUMNOS_INTERRUMPEN_ESTUDIOS, ALUMNOS_INTERRUMPEN_EST_ANO1, ALUMNOS_TRASLADAN_OTRA_UNIV, @DURACION_MEDIA_GRADUADOS, @TASA_EFICIENCIA, @FECHA_ACTUALIZACION)
SET DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres18.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, LOCALIDAD, ESTUDIO, TIPO_ESTUDIO, TIPO_EGRESO, SEXO, ALUMNOS_GRADUADOS, ALUMNOS_INTERRUMPEN_ESTUDIOS, ALUMNOS_INTERRUMPEN_EST_ANO1, ALUMNOS_TRASLADAN_OTRA_UNIV, @DURACION_MEDIA_GRADUADOS, @TASA_EFICIENCIA, @FECHA_ACTUALIZACION)
SET DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/alumnEgres17.csv'
INTO TABLE alumnosEgresados
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, LOCALIDAD, ESTUDIO, TIPO_ESTUDIO, TIPO_EGRESO, SEXO, ALUMNOS_GRADUADOS, ALUMNOS_INTERRUMPEN_ESTUDIOS, ALUMNOS_INTERRUMPEN_EST_ANO1, ALUMNOS_TRASLADAN_OTRA_UNIV, @DURACION_MEDIA_GRADUADOS, @TASA_EFICIENCIA, @FECHA_ACTUALIZACION)
SET DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');



create table if not exists plazasOfertadas(
    CURSO_ACADEMICO int,
    ESTUDIO varchar(200),
    LOCALIDAD varchar(100),
    CENTRO varchar(100),
    TIPO_CENTRO varchar(100),
    TIPO_ESTUDIO varchar(100),
    PLAZAS_OFERTADAS int,
    PLAZAS_MATRICULADAS int,
    PLAZAS_SOLICITADAS int,
    INDICE_OCUPACION double,
    FECHA_ACTUALIZACION date
);

LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas19.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, TIPO_CENTRO, TIPO_ESTUDIO, PLAZAS_OFERTADAS, PLAZAS_MATRICULADAS, PLAZAS_SOLICITADAS, @INDICE_OCUPACION, @FECHA_ACTUALIZACION)
SET INDICE_OCUPACION = IF(@INDICE_OCUPACION = '', 0, @INDICE_OCUPACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');


LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas18.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, TIPO_CENTRO, TIPO_ESTUDIO, PLAZAS_OFERTADAS, PLAZAS_MATRICULADAS, PLAZAS_SOLICITADAS, @INDICE_OCUPACION, @FECHA_ACTUALIZACION)
SET INDICE_OCUPACION = IF(@INDICE_OCUPACION = '', 0, @INDICE_OCUPACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');


LOAD DATA INFILE '/var/lib/mysql-files/oferPlazas17.csv'
INTO TABLE plazasOfertadas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, TIPO_CENTRO, TIPO_ESTUDIO, PLAZAS_OFERTADAS, PLAZAS_MATRICULADAS, PLAZAS_SOLICITADAS, @INDICE_OCUPACION, @FECHA_ACTUALIZACION)
SET INDICE_OCUPACION = IF(@INDICE_OCUPACION = '', 0, @INDICE_OCUPACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

create table if not exists resultadosTitulaciones(
    CURSO_ACADEMICO int,
    CENTRO varchar(100),
    ESTUDIO varchar(200),
    TIPO_ESTUDIO varchar(100),
    ALUMNOS_MATRICULADOS int,
    ALUMNOS_NUEVO_INGRESO int,
    PLAZAS_OFERTADAS int,
    ALUMNOS_GRADUADOS int,
    ALUMNOS_ADAPTA_GRADO_MATRI int,
    ALUMNOS_ADAPTA_GRADO_MATRI_NI int,
    ALUMNOS_ADAPTA_GRADO_TITULADO int,
    ALUMNOS_CON_RECONOCIMIENTO int,
    ALUMNOS_MOVILIDAD_ENTRADA int,
    ALUMNOS_MOVILIDAD_SALIDA int,
    CREDITOS_MATRICULADOS double,
    CREDITOS_RECONOCIDOS double,
    DURACION_MEDIA_GRADUADOS double,
    TASA_EXITO double,
    TASA_RENDIMIENTO double,
    TASA_EFICIENCIA double,
    TASA_ABANDONO double,
    TASA_GRADUACION double,
    FECHA_ACTUALIZACION date
);

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu19.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, CENTRO, ESTUDIO, TIPO_ESTUDIO, @ALUMNOS_MATRICULADOS, @ALUMNOS_NUEVO_INGRESO, @PLAZAS_OFERTADAS, @ALUMNOS_GRADUADOS, @ALUMNOS_ADAPTA_GRADO_MATRI, @ALUMNOS_ADAPTA_GRADO_MATRI_NI, @ALUMNOS_ADAPTA_GRADO_TITULADO, @ALUMNOS_CON_RECONOCIMIENTO, @ALUMNOS_MOVILIDAD_ENTRADA, @ALUMNOS_MOVILIDAD_SALIDA, @CREDITOS_MATRICULADOS, @CREDITOS_RECONOCIDOS, @DURACION_MEDIA_GRADUADOS, @TASA_EXITO, @TASA_RENDIMIENTO, @TASA_EFICIENCIA, @TASA_ABANDONO, @TASA_GRADUACION, @FECHA_ACTUALIZACION)
SET ALUMNOS_MATRICULADOS = IF(@ALUMNOS_MATRICULADOS = '', 0, @ALUMNOS_MATRICULADOS),
    ALUMNOS_NUEVO_INGRESO = IF(@ALUMNOS_NUEVO_INGRESO = '', 0, @ALUMNOS_NUEVO_INGRESO),
    PLAZAS_OFERTADAS = IF(@PLAZAS_OFERTADAS = '', 0, @PLAZAS_OFERTADAS),
    ALUMNOS_GRADUADOS = IF(@ALUMNOS_GRADUADOS = '', 0, @ALUMNOS_GRADUADOS),
    ALUMNOS_ADAPTA_GRADO_MATRI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI),
    ALUMNOS_ADAPTA_GRADO_MATRI_NI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI_NI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI_NI),
    ALUMNOS_ADAPTA_GRADO_TITULADO = IF(@ALUMNOS_ADAPTA_GRADO_TITULADO = '', 0, @ALUMNOS_ADAPTA_GRADO_TITULADO),
    ALUMNOS_CON_RECONOCIMIENTO = IF(@ALUMNOS_CON_RECONOCIMIENTO = '', 0, @ALUMNOS_CON_RECONOCIMIENTO),
    ALUMNOS_MOVILIDAD_ENTRADA = IF(@ALUMNOS_MOVILIDAD_ENTRADA = '', 0, @ALUMNOS_MOVILIDAD_ENTRADA),
    ALUMNOS_MOVILIDAD_SALIDA = IF(@ALUMNOS_MOVILIDAD_SALIDA = '', 0, @ALUMNOS_MOVILIDAD_SALIDA),
    CREDITOS_MATRICULADOS = IF(@CREDITOS_MATRICULADOS = '', 0, @CREDITOS_MATRICULADOS),
    CREDITOS_RECONOCIDOS = IF(@CREDITOS_RECONOCIDOS = '', 0, @CREDITOS_RECONOCIDOS),
    DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EXITO = IF(@TASA_EXITO = '', 0, @TASA_EXITO),
    TASA_RENDIMIENTO = IF(@TASA_RENDIMIENTO = '', 0, @TASA_RENDIMIENTO),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    TASA_ABANDONO = IF(@TASA_ABANDONO = '', 0, @TASA_ABANDONO),
    TASA_GRADUACION = IF(@TASA_GRADUACION = '', 0, @TASA_GRADUACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu18.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, CENTRO, ESTUDIO, TIPO_ESTUDIO, @ALUMNOS_MATRICULADOS, @ALUMNOS_NUEVO_INGRESO, @PLAZAS_OFERTADAS, @ALUMNOS_GRADUADOS, @ALUMNOS_ADAPTA_GRADO_MATRI, @ALUMNOS_ADAPTA_GRADO_MATRI_NI, @ALUMNOS_ADAPTA_GRADO_TITULADO, @ALUMNOS_CON_RECONOCIMIENTO, @ALUMNOS_MOVILIDAD_ENTRADA, @ALUMNOS_MOVILIDAD_SALIDA, @CREDITOS_MATRICULADOS, @CREDITOS_RECONOCIDOS, @DURACION_MEDIA_GRADUADOS, @TASA_EXITO, @TASA_RENDIMIENTO, @TASA_EFICIENCIA, @TASA_ABANDONO, @TASA_GRADUACION, @FECHA_ACTUALIZACION)
SET ALUMNOS_MATRICULADOS = IF(@ALUMNOS_MATRICULADOS = '', 0, @ALUMNOS_MATRICULADOS),
    ALUMNOS_NUEVO_INGRESO = IF(@ALUMNOS_NUEVO_INGRESO = '', 0, @ALUMNOS_NUEVO_INGRESO),
    PLAZAS_OFERTADAS = IF(@PLAZAS_OFERTADAS = '', 0, @PLAZAS_OFERTADAS),
    ALUMNOS_GRADUADOS = IF(@ALUMNOS_GRADUADOS = '', 0, @ALUMNOS_GRADUADOS),
    ALUMNOS_ADAPTA_GRADO_MATRI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI),
    ALUMNOS_ADAPTA_GRADO_MATRI_NI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI_NI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI_NI),
    ALUMNOS_ADAPTA_GRADO_TITULADO = IF(@ALUMNOS_ADAPTA_GRADO_TITULADO = '', 0, @ALUMNOS_ADAPTA_GRADO_TITULADO),
    ALUMNOS_CON_RECONOCIMIENTO = IF(@ALUMNOS_CON_RECONOCIMIENTO = '', 0, @ALUMNOS_CON_RECONOCIMIENTO),
    ALUMNOS_MOVILIDAD_ENTRADA = IF(@ALUMNOS_MOVILIDAD_ENTRADA = '', 0, @ALUMNOS_MOVILIDAD_ENTRADA),
    ALUMNOS_MOVILIDAD_SALIDA = IF(@ALUMNOS_MOVILIDAD_SALIDA = '', 0, @ALUMNOS_MOVILIDAD_SALIDA),
    CREDITOS_MATRICULADOS = IF(@CREDITOS_MATRICULADOS = '', 0, @CREDITOS_MATRICULADOS),
    CREDITOS_RECONOCIDOS = IF(@CREDITOS_RECONOCIDOS = '', 0, @CREDITOS_RECONOCIDOS),
    DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EXITO = IF(@TASA_EXITO = '', 0, @TASA_EXITO),
    TASA_RENDIMIENTO = IF(@TASA_RENDIMIENTO = '', 0, @TASA_RENDIMIENTO),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    TASA_ABANDONO = IF(@TASA_ABANDONO = '', 0, @TASA_ABANDONO),
    TASA_GRADUACION = IF(@TASA_GRADUACION = '', 0, @TASA_GRADUACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/resulTitu17.csv'
INTO TABLE resultadosTitulaciones
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, CENTRO, ESTUDIO, TIPO_ESTUDIO, @ALUMNOS_MATRICULADOS, @ALUMNOS_NUEVO_INGRESO, @PLAZAS_OFERTADAS, @ALUMNOS_GRADUADOS, @ALUMNOS_ADAPTA_GRADO_MATRI, @ALUMNOS_ADAPTA_GRADO_MATRI_NI, @ALUMNOS_ADAPTA_GRADO_TITULADO, @ALUMNOS_CON_RECONOCIMIENTO, @ALUMNOS_MOVILIDAD_ENTRADA, @ALUMNOS_MOVILIDAD_SALIDA, @CREDITOS_MATRICULADOS, @CREDITOS_RECONOCIDOS, @DURACION_MEDIA_GRADUADOS, @TASA_EXITO, @TASA_RENDIMIENTO, @TASA_EFICIENCIA, @TASA_ABANDONO, @TASA_GRADUACION, @FECHA_ACTUALIZACION)
SET ALUMNOS_MATRICULADOS = IF(@ALUMNOS_MATRICULADOS = '', 0, @ALUMNOS_MATRICULADOS),
    ALUMNOS_NUEVO_INGRESO = IF(@ALUMNOS_NUEVO_INGRESO = '', 0, @ALUMNOS_NUEVO_INGRESO),
    PLAZAS_OFERTADAS = IF(@PLAZAS_OFERTADAS = '', 0, @PLAZAS_OFERTADAS),
    ALUMNOS_GRADUADOS = IF(@ALUMNOS_GRADUADOS = '', 0, @ALUMNOS_GRADUADOS),
    ALUMNOS_ADAPTA_GRADO_MATRI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI),
    ALUMNOS_ADAPTA_GRADO_MATRI_NI = IF(@ALUMNOS_ADAPTA_GRADO_MATRI_NI = '', 0, @ALUMNOS_ADAPTA_GRADO_MATRI_NI),
    ALUMNOS_ADAPTA_GRADO_TITULADO = IF(@ALUMNOS_ADAPTA_GRADO_TITULADO = '', 0, @ALUMNOS_ADAPTA_GRADO_TITULADO),
    ALUMNOS_CON_RECONOCIMIENTO = IF(@ALUMNOS_CON_RECONOCIMIENTO = '', 0, @ALUMNOS_CON_RECONOCIMIENTO),
    ALUMNOS_MOVILIDAD_ENTRADA = IF(@ALUMNOS_MOVILIDAD_ENTRADA = '', 0, @ALUMNOS_MOVILIDAD_ENTRADA),
    ALUMNOS_MOVILIDAD_SALIDA = IF(@ALUMNOS_MOVILIDAD_SALIDA = '', 0, @ALUMNOS_MOVILIDAD_SALIDA),
    CREDITOS_MATRICULADOS = IF(@CREDITOS_MATRICULADOS = '', 0, @CREDITOS_MATRICULADOS),
    CREDITOS_RECONOCIDOS = IF(@CREDITOS_RECONOCIDOS = '', 0, @CREDITOS_RECONOCIDOS),
    DURACION_MEDIA_GRADUADOS = IF(@DURACION_MEDIA_GRADUADOS = '', 0, @DURACION_MEDIA_GRADUADOS),
    TASA_EXITO = IF(@TASA_EXITO = '', 0, @TASA_EXITO),
    TASA_RENDIMIENTO = IF(@TASA_RENDIMIENTO = '', 0, @TASA_RENDIMIENTO),
    TASA_EFICIENCIA = IF(@TASA_EFICIENCIA = '', 0, @TASA_EFICIENCIA),
    TASA_ABANDONO = IF(@TASA_ABANDONO = '', 0, @TASA_ABANDONO),
    TASA_GRADUACION = IF(@TASA_GRADUACION = '', 0, @TASA_GRADUACION),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

create table if not exists acuerdosMovilidad(
    CURSO_ACADEMICO int,
    NOMBRE_PROGRAMA_MOVILIDAD varchar(100),
    NOMBRE_AREA_ESTUDIOS_MOV varchar(100),
    CENTRO varchar(100),
    IN_OUT varchar(10),
    NOMBRE_IDIOMA_NIVEL_MOVILIDAD varchar(100),
    PAIS_UNIVERSIDAD_ACUERDO varchar(100),
    UNIVERSIDAD_ACUERDO varchar(100),
    PLAZAS_OFERTADAS_ALUMNOS int,
    PLAZAS_ASIGNADAS_ALUMNOS_OUT int,
    FECHA_ACTUALIZACION date
);

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov19.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, NOMBRE_PROGRAMA_MOVILIDAD, NOMBRE_AREA_ESTUDIOS_MOV, CENTRO, IN_OUT, NOMBRE_IDIOMA_NIVEL_MOVILIDAD, PAIS_UNIVERSIDAD_ACUERDO, UNIVERSIDAD_ACUERDO, PLAZAS_OFERTADAS_ALUMNOS, PLAZAS_ASIGNADAS_ALUMNOS_OUT, @FECHA_ACTUALIZACION)
SET FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov18.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, NOMBRE_PROGRAMA_MOVILIDAD, NOMBRE_AREA_ESTUDIOS_MOV, CENTRO, IN_OUT, NOMBRE_IDIOMA_NIVEL_MOVILIDAD, PAIS_UNIVERSIDAD_ACUERDO, UNIVERSIDAD_ACUERDO, PLAZAS_OFERTADAS_ALUMNOS, PLAZAS_ASIGNADAS_ALUMNOS_OUT, @FECHA_ACTUALIZACION)
SET FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/acuerdosMov17.csv'
INTO TABLE acuerdosMovilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, NOMBRE_PROGRAMA_MOVILIDAD, NOMBRE_AREA_ESTUDIOS_MOV, CENTRO, IN_OUT, NOMBRE_IDIOMA_NIVEL_MOVILIDAD, PAIS_UNIVERSIDAD_ACUERDO, UNIVERSIDAD_ACUERDO, PLAZAS_OFERTADAS_ALUMNOS, PLAZAS_ASIGNADAS_ALUMNOS_OUT, @FECHA_ACTUALIZACION)
SET FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

create table if not exists notasCorte(
    CURSO_ACADEMICO int,
    ESTUDIO varchar(120),
    LOCALIDAD varchar(100),
    CENTRO varchar(100),
    PRELA_CONVO_NOTA_DEF double,
    NOTA_CORTE_DEFINITIVA_JULIO double,
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE double,
    FECHA_ACTUALIZACION date
);

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte19.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, @PRELA_CONVO_NOTA_DEF, @NOTA_CORTE_DEFINITIVA_JULIO, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE, @FECHA_ACTUALIZACION)
SET PRELA_CONVO_NOTA_DEF = IF(@PRELA_CONVO_NOTA_DEF = '', 0, @PRELA_CONVO_NOTA_DEF),
    NOTA_CORTE_DEFINITIVA_JULIO = IF(@NOTA_CORTE_DEFINITIVA_JULIO = '', 0, @NOTA_CORTE_DEFINITIVA_JULIO),
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = IF(@NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = '', 0, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte18.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, @PRELA_CONVO_NOTA_DEF, @NOTA_CORTE_DEFINITIVA_JULIO, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE, @FECHA_ACTUALIZACION)
SET PRELA_CONVO_NOTA_DEF = IF(@PRELA_CONVO_NOTA_DEF = '', 0, @PRELA_CONVO_NOTA_DEF),
    NOTA_CORTE_DEFINITIVA_JULIO = IF(@NOTA_CORTE_DEFINITIVA_JULIO = '', 0, @NOTA_CORTE_DEFINITIVA_JULIO),
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = IF(@NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = '', 0, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');

LOAD DATA INFILE '/var/lib/mysql-files/notasCorte17.csv'
INTO TABLE notasCorte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CURSO_ACADEMICO, ESTUDIO, LOCALIDAD, CENTRO, @PRELA_CONVO_NOTA_DEF, @NOTA_CORTE_DEFINITIVA_JULIO, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE, @FECHA_ACTUALIZACION)
SET PRELA_CONVO_NOTA_DEF = IF(@PRELA_CONVO_NOTA_DEF = '', 0, @PRELA_CONVO_NOTA_DEF),
    NOTA_CORTE_DEFINITIVA_JULIO = IF(@NOTA_CORTE_DEFINITIVA_JULIO = '', 0, @NOTA_CORTE_DEFINITIVA_JULIO),
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = IF(@NOTA_CORTE_DEFINITIVA_SEPTIEMBRE = '', 0, @NOTA_CORTE_DEFINITIVA_SEPTIEMBRE),
    FECHA_ACTUALIZACION = STR_TO_DATE(REPLACE(@FECHA_ACTUALIZACION, "/", "-"), '%d-%m-%Y');