#con este script importamos todos los ficheros a la carpeta de mysql
./scriptImportarFicheros.sh

#Con este comando creamos la base de datos y todas las tablas dentro de la base de datos
mysql -u diego -pdiego practica1 < crearTablasBD.sql

#Con este comando importamos todos los datos de los csv a las tablas creadas
mysql -u diego -pdiego practica1 < scriptImportarFicherosCSV.sql

#Con este comando creamos introducimos todos los datos de las tablas anteriores en las tablas definitivas
mysql -u diego -pdiego practica1 < scriptInsertarDatosMySQL.sql

#Con este comando creamos los triggers 
mysql -u diego -pdiego practica1 < triggerMySQL.sql

#con este comando realizamos las consultas
mysql -u diego -pdiego practica1 < consultasMySQL.sql