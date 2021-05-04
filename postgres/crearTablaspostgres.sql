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
    duracion_media_graduados float,
    tasa_eficiencia float,
    fecha_actualizacion varchar(100)
);

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
    indice_ocupacion float,
    fecha_actualizacion varchar(100)
);

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
    creditos_matriculados float,
    creditos_reconocidos float,
    duracion_media_graduados float,
    tasa_exito float,
    tasa_rendimiento float,
    tasa_eficiencia float,
    tasa_abandono float,
    tasa_graduacion float,
    fecha_actualizacion varchar(100)
);

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
    fecha_actualizacion varchar(100)
);

create table if not exists notasCorte(
    curso_academico int,
    estudio varchar(120),
    localidad varchar(100),
    centro varchar(100),
    prela_convo_nota_def float,
    nota_corte_definitiva_julio float,
    nota_corte_definitiva_septiembre float,
    fecha_actualizacion varchar(100)
);

CREATE TABLE tipo_centro (
     id_tipo_centro serial not null PRIMARY KEY,
     tipo_centro varchar(200) not null
);

create table if not exists tipo_estudio(
    id_tipo_estudio serial primary key not null,
    tipo_estudio varchar(200) not null
);

create table if not exists localidad(
    id_localidad serial primary key not null,
    nom_localidad varchar(200) not null
);

create table if not exists centro(
    nom_centro varchar(200) primary key not null,
    id_tipo_centro int not null,
    id_localidad int not null,
    foreign key (id_tipo_centro) references tipo_centro(id_tipo_centro),
    foreign key (id_localidad) references localidad(id_localidad)
);

create table if not exists estudios(
    nom_estudio varchar(200) primary key not null,
    id_tipo_estudio int not null,
    foreign key (id_tipo_estudio) references tipo_estudio(id_tipo_estudio)
);

create table if not exists imparte(
    nom_centro varchar(200) not null,
    nom_estudio varchar(200) not null,
    PRIMARY KEY (nom_centro, nom_estudio), 
    foreign key (nom_centro) references centro(nom_centro),
    foreign key (nom_estudio) references estudios(nom_estudio)
);

create table if not exists cursos(
    nom_centro varchar(200) not null,
    nom_estudio varchar(200) not null,
    curso_academico int not null,
    PRIMARY KEY (nom_centro, nom_estudio,curso_academico), 
    plazas_matriculadas int,
    plazas_ofertadas int,
    plazas_solicitadas int,
    indice_ocupacion float,
    alumnos_graduados int,
    tasa_abandono float,
    tasa_eficiencia float,
    tasa_exito float,
    tasa_graduados float,
    alumnos_matriculados int,
    alumnos_nuevos int,
    nota_corte_julio float,
    nota_corte_septiembre float,
    foreign key (nom_centro, nom_estudio) references imparte(nom_centro, nom_estudio)
);

create table if not exists idioma(
    id_idioma serial primary key,
    nom_idioma varchar(200) not null
);

create table if not exists pais(
    id_pais serial primary key not null ,
    nom_pais varchar(200) not null
);

create table if not exists universidadMovilidad(
    id_universidad serial primary key not null,
    nom_universidad varchar(200) not null,
    id_pais int not null,
    foreign key (id_pais) references pais(id_pais)
);

create table if not exists areaEstudiosMovilidad(
    id_area_estudios serial primary key not null,
    nom_area_estudios varchar(200) not null
);

create type in_Out as enum('IN', 'OUT');
create type program as enum('ERASMUS', 'SICUE');

create table if not exists tieneConvenioMovilidad(
    nom_centro varchar(200) not null,
    id_universidad int not null,
    id_area_estudios int not null,
    plazas_asignadas int not null,
    plazasOfertadas int not null,
    in_out in_Out not null,
    anyo int not null,
    programa program not null,
    id_idioma int not null,
    primary key(nom_centro, id_universidad, id_area_estudios, in_out, anyo, programa, id_idioma),
    foreign key (nom_centro) references centro(nom_centro),
    foreign key (id_universidad) references universidadMovilidad(id_universidad),
    foreign key (id_area_estudios) references areaEstudiosMovilidad(id_area_estudios),
    foreign key (id_idioma) references idioma(id_idioma)
);

create table if not exists datosTrigger(
    id_operacion serial primary key not null,
    tipo_operacion varchar(50) not null,
    usuario_operacion varchar(100) not null,
    fecha date not null,
    clave_primaria_afectada varchar(200) not null
);