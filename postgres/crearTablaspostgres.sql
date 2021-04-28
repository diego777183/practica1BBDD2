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
    constraint fk_id_tipo_centro foreign key (id_tipo_centro) references tipo_centro(id_tipo_centro),
    constraint fk_id_localidad foreign key (id_localidad) references localidad(id_localidad)

);

create table if not exists estudios(
    nom_estudio varchar(200) primary key not null,
    id_tipo_estudio int not null,
    constraint fk_id_tipo_estudio foreign key (id_tipo_estudio) references tipo_estudio(id_tipo_estudio)
);

create table if not exists imparte(
    nom_centro varchar(200) not null UNIQUE,
    nom_estudio varchar(200) not null UNIQUE,
    PRIMARY KEY (nom_centro, nom_estudio), 
    
    constraint fk_nom_centro foreign key (nom_centro) references centro(nom_centro),
    constraint fk_nom_estudio foreign key (nom_estudio) references estudios(nom_estudio)
);

create table if not exists cursos(
    nom_centro varchar(200) not null,
    nom_estudio varchar(200) not null,
    curso_academico int not null,
    PRIMARY KEY (nom_centro, nom_estudio,curso_academico), 
    plazas_matriculadas int not null,
    plazas_ofertadas int not null,
    plazas_solicitadas int not null,
    indice_ocupacion float not null,
    alumnos_graduados int not null,
    tasa_abandono float not null,
    tasa_eficiencia float not null,
    tasa_exito float not null,
    tasa_graduados float not null,
    alumnos_matriculados int not null,
    alumnos_nuevos int not null,
    nota_corte_julio float not null,
    nota_corte_septiembre float not null,
    constraint fk_nom_centro foreign key (nom_centro) references imparte(nom_centro),
    constraint fk_nom_estudio foreign key (nom_estudio) references imparte(nom_estudio)
);

create table if not exists datosTrigger(
    id_operacion serial primary key not null ,
    tipo_operacion varchar(50) not null,
    usuario_operacion varchar(100) not null,
    fecha date not null,
    clave_primaria_afectada varchar(200) not null
);