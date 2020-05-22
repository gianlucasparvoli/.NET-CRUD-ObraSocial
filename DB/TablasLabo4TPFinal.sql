USE [master]
GO
CREATE DATABASE [ObraSocial_Labo4]
GO
USE ObraSocial_Labo4
GO
--CREATES
CREATE TABLE Socios(
	nro_socio_int int NOT NULL,
	apellido char(40) NOT NULL,
	nombre char(40) NOT NULL,
	nro_documento char(10) NOT NULL,
	fecha_nacimiento date NOT NULL,
	sexo char(1) NOT NULL,
	nro_socio char(8) NOT NULL,
	nro_socio_titular char(8) NOT NULL,
	parentesco char(3) NOT NULL,
	plan_os char(4) NOT NULL,
	direccion varchar(80) NOT NULL,
	cp char(4) NOT NULL,
	telefonos char(40) NOT NULL,
	mail char(60) NOT NULL,
	estado char(3) NOT NULL
	CONSTRAINT [PK_Socios] PRIMARY KEY (nro_socio_int)
	--FOREIGN KEY (cp) REFERENCES Localidades(cp)
)

ALTER TABLE Socios WITH CHECK ADD  CONSTRAINT [CK_sexo] CHECK  ((sexo='M' OR sexo='F'))
ALTER TABLE Socios WITH CHECK ADD  CONSTRAINT [CK_parentesco] CHECK  ((parentesco='HIJ' OR parentesco='CON' OR parentesco='PAD' OR parentesco = 'TIT'))
ALTER TABLE Socios WITH CHECK ADD  CONSTRAINT [CK_plan_os] CHECK  ((plan_os='1000' OR plan_os='2000' OR plan_os='3000' OR plan_os = '5000'))
ALTER TABLE Socios WITH CHECK ADD  CONSTRAINT [CK_estado] CHECK  ((estado='ACT' OR estado='BAJ'))

GO

CREATE TABLE tramites_cambio_plan(
	nro_tramite numeric(6) NOT NULL,
	nro_socio char(8) NOT NULL,
	plan_actual char(4) NOT NULL,
	plan_nuevo char(4) NOT NULL,
	estado char(3) NOT NULL,
	fecha_resolucion datetime NOT NULL,
	usuario_ult_modif char(10) NOT NULL
	CONSTRAINT [PK_tramites_cambio_plan] PRIMARY KEY (nro_tramite)
)
ALTER TABLE tramites_cambio_plan WITH CHECK ADD  CONSTRAINT [CK_estado_tramites_cambio_plan] CHECK  ((estado='PEN' OR estado='APL' OR estado='REC'))


GO

CREATE TABLE usuarios (
	nro_usuario numeric(4) NOT NULL,
	usuario char(10) NOT NULL,
	apellido char(20) NOT NULL,
	nombre char(20) NOT NULL,
	clave char(10) NOT NULL,
	fecha_cambio datetime NOT NULL,
	CONSTRAINT PK_usuarios PRIMARY KEY (nro_usuario)
)
 GO

CREATE TABLE zf_formularios (
	formulario char(4) NOT NULL,
	pagina char(50) NOT NULL,
	nombre_menu char(15) NOT NULL,
	descripcion char(255) NOT NULL,
	estado char(3) NOT NULL,
	grupo char(3) NOT NULL,
	CONSTRAINT PK_zf_formularios PRIMARY KEY CLUSTERED (formulario)
)

GO

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--INSERTS
--Para Socios
INSERT INTO Socios VALUES(
	'1',	--nro_socio_int
	'Perez',	--apellido
	'Juan',		--nombre
	'25668853',	--nro_documento
	'09/05/1970',	--fecha_nacimiento
	'M',	--sexo
	'1',	--nro_socio
	'1',	--nro_socio_titular
	'TIT',	--parentesco
	'2000',	--plan_os
	'Savio 963',	--direccion
	'2900',	--cp
	'3364236598',	--telefonos
	'jp@gmail.com',	--mail
	'ACT'	--estado
)
----
INSERT INTO Socios VALUES(
	'2',	--nro_socio_int
	'Perez',	--apellido
	'Rodrigo',		--nombre
	'42555987',	--nro_documento
	'02/01/1999',	--fecha_nacimiento
	'M',	--sexo
	'2',	--nro_socio
	'1',	--nro_socio_titular
	'HIJ',	--parentesco
	'2000',	--plan_os
	'Savio 963',	--direccion
	'2900',	--cp
	'3364236598',	--telefonos
	'rp@gmail.com',	--mail
	'ACT'	--estado
)
----
INSERT INTO Socios VALUES(
	'3',	--nro_socio_int
	'Rios',	--apellido
	'Manuela',		--nombre
	'25871132',	--nro_documento
	'02/01/1978',	--fecha_nacimiento
	'F',	--sexo
	'3',	--nro_socio
	'1',	--nro_socio_titular
	'CON',	--parentesco
	'2000',	--plan_os
	'Savio 963',	--direccion
	'2900',	--cp
	'3364989865',	--telefonos
	'rm@gmail.com',	--mail
	'ACT'	--estado
)
----
INSERT INTO Socios VALUES(
	'4',	--nro_socio_int
	'Armani',	--apellido
	'Delfina',		--nombre
	'25661132',	--nro_documento
	'02/01/1973',	--fecha_nacimiento
	'F',	--sexo
	'4',	--nro_socio
	'4',	--nro_socio_titular
	'TIT',	--parentesco
	'2000',	--plan_os
	'Savio 63',	--direccion
	'2900',	--cp
	'3364995525',	--telefonos
	'rm@gmail.com',	--mail
	'ACT'	--estado
)

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--Para tramites_cambio_plan
INSERT INTO tramites_cambio_plan VALUES(
	'1',	--nro_tramite
	'1',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'APL',	--estado
	'04/09/2019',	--fecha_resolucion
	'Juan Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'2',	--nro_tramite
	'2',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'APL',	--estado
	'04/09/2019',	--fecha_resolucion
	'Rod. Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'3',	--nro_tramite
	'3',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'APL',	--estado
	'04/09/2019',	--fecha_resolucion
	'Man. Rios'	--usuario_ult_modif
)
-----
INSERT INTO tramites_cambio_plan VALUES(
	'4',	--nro_tramite
	'4',	--nro_socio
	'3000',	--plan_actual
	'5000', --plan_nuevo
	'PEN',	--estado
	'04/09/2019',	--fecha_resolucion
	'Rod. Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'5',	--nro_tramite
	'5',	--nro_socio
	'3000',	--plan_actual
	'5000', --plan_nuevo
	'REC',	--estado
	'11/11/2019',	--fecha_resolucion
	'Rod. Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'6',	--nro_tramite
	'6',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'APL',	--estado
	'11/11/2019',	--fecha_resolucion
	'Rod. Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'7',	--nro_tramite
	'7',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'PEN',	--estado
	'11/11/2019',	--fecha_resolucion
	'Juan Perez'	--usuario_ult_modif
)
----
INSERT INTO tramites_cambio_plan VALUES(
	'8',	--nro_tramite
	'8',	--nro_socio
	'2000',	--plan_actual
	'5000', --plan_nuevo
	'PEN',	--estado
	'11/11/2019',	--fecha_resolucion
	'D. Armani'	--usuario_ult_modif
)

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--Para usuarios
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (1, 'ggarretts0', 'Garretts', 'Godard', '4P2jILP', '10/4/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (2, 'dheinssen1', 'Heinssen', 'Deirdre', 'LiL9Rg', '8/14/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (3, 'klapides2', 'Lapides', 'Kania', 'CvEypt4o', '5/7/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (4, 'kcree3', 'Cree', 'Kristina', '5XhlURB', '7/18/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (5, 'stop4', 'Top', 'Scarlet', 'GqtikeW7G8', '5/12/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (6, 'facosta5', 'Acosta', 'Freida', '4ncZLTNg', '3/15/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (7, 'tdurkin6', 'Durkin', 'Tessi', 'bSJtgH', '11/27/2018');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (8, 'drodolico7', 'Rodolico', 'Delia', 'ywpX5Ej2mF', '3/11/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (9, 'lhalpine8', 'Halpine', 'Lev', 'PUqfkmSFq', '10/15/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (10, 'sbanck9', 'Banck', 'Sanford', '0fgefpyh', '6/5/2019');
insert into usuarios (nro_usuario, usuario, apellido, nombre, clave, fecha_cambio) values (11, 'root', 'Admin', 'Admin', 'root', '11/11/2019');

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--Para zf_formularios 
insert into zf_formularios (formulario, pagina, nombre_menu, descripcion, estado, grupo) values (1,'Ej2.3.aspx','Socios', 'Ejercicio 2.3', 'ACT', 'NSE');
insert into zf_formularios (formulario, pagina, nombre_menu, descripcion, estado, grupo) values (2,'Ej2.6.aspx','Tramites', 'Ejercicio 2.6', 'ACT', 'NSE');
insert into zf_formularios (formulario, pagina, nombre_menu, descripcion, estado, grupo) values (3,'Ej2.7.aspx','Autorizaciones', 'Ejercicio 2.7', 'ACT', 'NSE');
