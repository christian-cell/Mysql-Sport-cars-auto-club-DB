CREATE TABLE IF NOT EXISTS database automocion;

CREATE TABLE usuarios (
 id INT PRIMARY KEY AUTO_INCREMENT,
 usuario VARCHAR(20),
 nombre VARCHAR(20),
 sexo VARCHAR(1),
 nivel TINYINT,
 email VARCHAR(50),
 telefono VARCHAR(20),
 marca VARCHAR(20),
 aseguradora VARCHAR(20),
 saldo FLOAT,
 activo BOOLEAN   
);

--INSERTS--


INSERT INTO usuarios VALUES
( '1' , 'GHE45' , 'Christian' , 'H' , '3' , 'christian@gmail.com', '656748394' , 'FORD', 'CAOS', '200' , '1' ),
( '2' , 'GHE42' , 'Maria' , 'M' , '7' , 'Maria@gmail.com', '656748394' , 'FERRARI', 'CAOS', '100' , '0' ),
( '3' , 'JHE43' , 'Paco' , 'H' , '6' , 'Paco@gmail.com', '656748394' , 'PEUGEOT', 'CVAR', '300' , '1' ),
( '4' , 'GHE12' , 'Carla' , 'M' , '2' , 'Carla@gmail.com', '656748394' , 'RENAULT', 'BARD', '10' , '0' ),
( '5' , 'GHE09' , 'Fernando' , 'H' , '8' , 'Fernando@yahoo.com', '656748394' , 'DACIA', 'CARLING', '200' , '1' ),
( '6' , 'GHE35' , 'Rosa' , 'M' , '7' , 'Rosa@gmail.com', '656748394' , 'PORCHE', 'HNOS', '500' , '0' ),
( '7' , 'GHE33' , 'Pedro' , 'H' , '4' , 'Pedro@yahoo.com', '656748394' , 'LAMBORGHINI', 'HERRENOS', '500' , '1' ),
( '8' , 'GHE34' , 'Milena' , 'M' , '5' , 'Milena@gmail.com', '656748394' , 'SEAT', 'MURUA', '2000' , '1' ),
( '9' , 'FHE45' , 'Rosendo' , 'H' , '1' , 'Rosendo@yahoo.com', '656748394' , 'OPEL', 'CRASH', '600' , '0' ),
( '10' , 'RHE45' , 'Paca' , 'M' , '2' , 'Paca@outlook.com', '656748394' , 'OPEL', 'CHOQUETON', '200' , '1' ),
( '11' , 'EHE45' , 'Rodolfo' , 'H' , '3' , 'Rodolfo@gmail.com', '656748394'  , 'RENAULT', 'FAVORITA', '20' , '0' ),
( '12' , 'EHG32' , 'Rigoberto' , 'H' , '6' , 'Rigoberto@gmail.com', '656748345'  , 'RENAULT', 'FAVORITA', '30' , '1' ),
( '13' , 'RCE45' , 'Josefa' , 'M' , '2' , 'Josefa@outlook.com', '656748395' , 'OPEL', 'CHOQUETON', '0' , '1' ),
( '14' , 'RCE44' , 'Giselle' , 'M' , '2' , 'Giselle@outlook.com', '656748334' , 'OPEL', 'CHOQUETON', '200' , '1' );


--mostrar el maximo saldo de mis clientes mujeres--
SELECT MAX(saldo) FROM usuarios WHERE sexo = 'M';

--mostrar el nombre , telefono de los usuarios que tengan un coche de la marca ford ,renault, dacia--
SELECT nombre,telefono FROM usuarios WHERE marca IN('FORD','RENAULT','DACIA');

--contar usuarios sin saldo y que esten inactivos--
SELECT COUNT(*) FROM usuarios WHERE NOT activo OR saldo <= 0;

--listar el login de los usuarios con nivel 1 ,2 ,3--
SELECT usuario FROM usuarios WHERE nivel IN(1,2,3);

--listar los numeros de telefono con un saldo menor o igual a 300--
SELECT telefono FROM usuarios WHERE saldo<=300;

--sumar los saldos de los usuarios que tengan la compañía FAVORITA--
SELECT SUM(saldo) FROM usuarios WHERE aseguradora= "FAVORITA";

--contar la cantidad de usuarios por compañía aseguradora--
SELECT aseguradora, COUNT(*) FROM usuarios GROUP BY aseguradora;

--listar el login de los usuarios con nivel 2--
SELECT usuario FROM usuarios WHERE nivel = 2;

--mostrar el email de los usuarios que usan gmail--
SELECT email FROM usuarios WHERE email LIKE '%gmail.com';

--cuenta los usuarios que usan yahoo--
SELECT COUNT(*) FROM usuarios WHERE email LIKE '%yahoo.com';

--mostrar el nombre del usuario que tiene un email que empieza por PEDRO--
SELECT nombre FROM usuarios WHERE email LIKE 'Pedro%';

--mostrar el nombre y telefono de los usuarios con coche marca FORD , FERRARI, RENAULT--
SELECT nombre, telefono,marca FROM usuarios WHERE marca IN('FORD', 'FERRARI','RENAULT');

--mostrar los nombres de los usuarios sin saldo o inactivos--
SELECT nombre FROM usuarios WHERE saldo<=0 or NOT activo;

--mostrar el nombre , login y el telefono de los usuarios con aseguradora CHOQUETON O HNOS--
SELECT nombre, usuario, telefono FROM usuarios WHERE aseguradora IN('CHOQUETON', 'HNOS');

--mostrar las diferentoes marcas de coche en ordern alfabético ascendente/descente/aleatorio--
SELECT DISTINCT marca FROM usuarios ORDER BY marca ASC;  
SELECT DISTINCT marca FROM usuarios ORDER BY marca DESC;  
SELECT DISTINCT marca FROM usuarios ORDER BY RAND();  

--mostrar el nombre , login y telefono de los usuarios de las aseguradoras CHOQUETON Y HNOS--
SELECT nombre, usuario, telefono FROM usuarios WHERE aseguradora IN('CHOQUETON','HNOS');

--mostrar el nombre , login y telefono de los usuarios que NO tengan coches de la marca RENAULT,FORD,PEUGEOT,OPEL--
SELECT nombre ,marca, usuario ,telefono FROM usuarios WHERE marca NOT IN('RENAULT','FORD','PEUGEOT','OPEL');

--mostrar el nombre , telefono de los usuarios con coche que no sea RENAULT--
SELECT nombre , telefono FROM usuarios WHERE marca NOT IN('RENAULT');

--mostrar el nombre , telefono de los usuarios con coche que no sea RENAULT , FORD ,OPEL--
SELECT nombre , telefono FROM usuarios WHERE marca NOT IN('RENAULT', 'FORD', 'OPEL');

--mostrar el login y telefono de los usuarios con la aseguradora CHOQUETON--
SELECT usuario telefono FROM usuarios WHERE aseguradora = 'CHOQUETON';

--mostrat las diferentes marcas de coche en orden alfabético descendente--
SELECT DISTINCT marca FROM usuarios ORDER BY marca DESC;

--mostrar las diferentes aseguradoras con un ordern alfabético aleatorio--
SELECT DISTINCT aseguradora FROM usuarios ORDER BY RAND();

--mostrar el login de los usuarios cuyo nivel sea 1 y2;
SELECT usuario FROM usuarios WHERE nivel IN(1,2);

--calcula el saldo promedio de los usuarios que tienen un coche de la marca RENAULT--
SELECT AVG(saldo) FROM usuarios WHERE marca IN('RENAULT');

--mostrar el login de los usuarios con nivel 1 o 3--
SELECT usuario FROM usuarios WHERE nivel IN(1,3);

--mostrar nombre y telefono de los usuarios con coche que no sea de la marca RENAULT--
--modo alternativo--
SELECT nombre , telefono FROM usuarios WHERE marca NOT IN ('RENAULT');
SELECT nombre , telefono FROM usuarios WHERE marca <> ('RENAULT');

--mostrar el login de los usuarios con nivel 3--
SELECT usuario FROM usuarios WHERE nivel = 3;

--contar el numero de usuarios por sexo--
SELECT COUNT(*) FROM usuarios GROUP BY sexo;

--mostrar el login y telefono de los usuarios con la aseguradora FAVORITA--
SELECT usuario ,telefono FROM usuarios WHERE aseguradora = 'FAVORITA';

--mostrar todas las aseguradoras con orden alfabético descendente--
SELECT DISTINCT aseguradora FROM usuarios ORDER BY aseguradora DESC;

--mostrar el login de los usuarios inactivos--
SELECT usuario FROM usuarios WHERE NOT activo;

--mostrar los números de telefono de los socios sin saldo--
SELECT telefono FROM usuarios WHERE saldo <=0;

--calcular el saldo mínimo de los usuarios de sexo "HOMBRE"--
SELECT MIN(saldo) FROM usuarios WHERE sexo = 'H';

--mostrar los numeros de teléfonos de clientes con un saldo mayor a 300--
SELECT telefono FROM usuarios WHERE saldo>300;

--contar el numero de usuarios por la marca de coche--
SELECT COUNT(*) FROM usuarios GROUP BY marca;

--mostrar nombre y telefono de los usuarios con coche que no sea de la marca FORD--
SELECT nombre , telefono FROM usuarios WHERE marca NOT IN('FORD');
--modo alternativo--
SELECT nombre , telefono FROM usuarios WHERE marca <>('FORD');

--mostrar las diferentes compañías en orden alfabético descendente--
SELECT DISTINCT aseguradora FROM usuarios GROUP BY aseguradora DESC;

--calcula la suma de los saldos de los usuarios de la aseguradora CHOQUETON--
SELECT SUM(saldo) FROM usuarios WHERE aseguradora = 'CHOQUETON';

--mostrar el email de los usuarios que usan yahoo.com--
SELECT nombre , email FROM usuarios WHERE email LIKE '%yahoo';






