SET IDENTITY_INSERT appLocation.dbo.usuarios ON;

INSERT INTO appLocation.dbo.usuarios (id_usuario, nombre, apellido_paterno, apellido_materno, cargo, correo, password) VALUES (1, 'Miguel', 'marquez', 'hernandez', 'admin', 'miguel@hotmail.com', '123456789');
INSERT INTO appLocation.dbo.usuarios (id_usuario, nombre, apellido_paterno, apellido_materno, cargo, correo, password) VALUES (2, 'Kevin', 'kevin2', 'kevin3', 'admin', 'kevin@hotmail.com', 'abcde123456');
INSERT INTO appLocation.dbo.usuarios (id_usuario, nombre, apellido_paterno, apellido_materno, cargo, correo, password) VALUES (3, 'Eduardo', 'eduardo', 'eduardo3', 'admin', 'eduardo@hotmail.com', 'lalo123456');

SET IDENTITY_INSERT appLocation.dbo.usuarios OFF;