CREATE TABLE tipo_centro (
     id_tipo_centro int primary key not null AUTO_INCREMENT,
     nom_centro varchar(100) not null
);

create table if not exists localidad(
    id_localidad int primary key not null AUTO_INCREMENT,
    nom_localidad varchar(60) not null
);

create table if not exists tipo_estudio(
    id_tipo_estudio int primary key not null AUTO_INCREMENT,
    nom_estudio varchar(100) not null
);

create table if not exists centro(
    nom_centro varchar(100) primary key not null,
    id_tipo_centro int not null,
    id_localidad int not null,
    foreign key (id_tipo_centro) references tipo_centro(id_tipo_centro),
    foreign key (id_localidad) references localidad(id_localidad)
);

create table if  not exists acuerdosMov(
    nom_centro_p1 varchar(100) not null,
    nom_centro_p2 varchar(100) not null,
    universidad_acuerdo varchar(100) not null,
    plazas_ofertadas_alumnos int not null,
    plazas_asignadas_alumnos int not null,
    pais_universidad_acuerdo varchar(100) not null,
    nombre_idioma_nivel_movilidad varchar(100) not null,
    primary key(nom_centro_p1,nom_centro_p2),
    foreign key (nom_centro_p1) references centro(nom_centro),
    foreign key (nom_centro_p2) references centro(nom_centro)
    
);

create table if not exists estudios(
    nom_estudio varchar(100) primary key not null,
    id_tipo_estudio int not null,
    foreign key (id_tipo_estudio) references tipo_estudio(id_tipo_estudio)
);

create table if not exists imparte(
    nom_centro varchar(100) not null,
    nom_estudio varchar(100) not null,
    PRIMARY KEY (nom_centro, nom_estudio), 
    foreign key (nom_centro) references centro(nom_centro),
    foreign key (nom_estudio) references estudios(nom_estudio)
);

create table if not exists plazas(
    nom_centro varchar(100) not null,
    nom_estudio varchar(100) not null,
    curso_academico int not null,
    PRIMARY KEY (nom_centro, nom_estudio,curso_academico), 
    plazas_matriculadas int not null,
    plazas_ofertadas int not null,
    plazas_solicitadas int not null,
    indice_ocupacion int not null,
    foreign key (nom_centro) references imparte(nom_centro),
    foreign key (nom_estudio) references imparte(nom_estudio)
);

create table if not exists resultados(
    nom_centro varchar(100) not null,
    nom_estudio varchar(100) not null,
    curso_academico int not null,
    PRIMARY KEY (nom_centro, nom_estudio,curso_academico), 
    alumnos_graduados int not null,
    tasa_abandono int not null,
    tasa_eficiencia int not null,
    tasa_exito int not null,
    tasa_graduados int not null,
    alumnos_matriculados int not null,
    alumnos_nuevos int not null,
    foreign key (nom_centro) references imparte(nom_centro),
    foreign key (nom_estudio) references imparte(nom_estudio)
);

create table if not exists notas(
    nom_centro varchar(100) not null,
    nom_estudio varchar(100) not null,
    curso_academico int not null,
    PRIMARY KEY (nom_centro, nom_estudio,curso_academico), 
    nota_corte_julio int not null,
    nota_corte_septiembre int not null,
    foreign key (nom_centro) references imparte(nom_centro),
    foreign key (nom_estudio) references imparte(nom_estudio)
);
