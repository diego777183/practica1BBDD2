#con este script importamos todos los ficheros a la carpeta de mysql
cd /home/alumno/practica1BBDD2/ficheros/
./scriptImportar.sh

#con este comando creamos las tablas de la base de datos
psql -U diego -d practica1postgres < /home/alumno/practica1BBDD2/postgres/crearTablaspostgres.sql

#con este comando importamos los datos de los csv a las tablas auxiliares
psql -U diego -d practica1postgres < /home/alumno/practica1BBDD2/postgres/importarFicherosCSVpostgres.sql

#con este comando insertamos los datos en las tablas
psql -U diego -d practica1postgres < /home/alumno/practica1BBDD2/postgres/insertarDatosPostgres.sql

#con este comando creamos las funciones y los triggers 
psql -U diego -d practica1postgres < /home/alumno/practica1BBDD2/postgres/crearFunciones.sql

#con este comando realizamos las consultas
psql -U diego -d practica1postgres < /home/alumno/practica1BBDD2/postgres/consultas.sql