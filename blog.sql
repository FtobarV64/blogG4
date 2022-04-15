-- Requerimientos
-- 1. Crear base de datos llamada blog.
\c ftobarv
DROP DATABASE blog;
CREATE DATABASE blog;
\c blog
-- Definimos el formato de fecha a utilizar en nuestra base de datos 
SET datestyle TO "YMD";
-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.
CREATE TABLE usuario(
    id SERIAL PRIMARY KEY,
    email VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuario(id),
    titulo VARCHAR(100) NOT NULL UNIQUE,
    fecha DATE
);
CREATE TABLE comentario(
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES post(id),
    usuario_id INT NOT NULL REFERENCES usuario(id),
    texto VARCHAR NOT NULL,
    fecha DATE NOT NULL
);
-- 3. Insertar los siguientes registros.
-- USUARIOS
-- id email
    INSERT INTO usuario(id, email)
    VALUES(1, 'usuario01@hotmail.com');
    INSERT INTO usuario(id, email)
    VALUES(2,'usuario02@gmail.com');
    INSERT INTO usuario(id, email)
    VALUES(3,'usuario03@gmail.com');
    INSERT INTO usuario(id, email)
    VALUES(4,'usuario04@hotmail.com' );
    INSERT INTO usuario(id, email)
    VALUES(5,'usuario05@yahoo.com'); 
    INSERT INTO usuario(id, email)
    VALUES(6,'usuario06@hotmail.com'); 
    INSERT INTO usuario(id, email)
    VALUES(7,'usuario07@yahoo.com'); 
    INSERT INTO usuario(id, email)
    VALUES(8,'usuario08@yahoo.com'); 
    INSERT INTO usuario(id, email)
    VALUES(9,'usuario09@yahoo.com'); 
-- POST
-- id usuario_id título fecha
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(1, 1, 'Post 1: Esto es malo', '2020-06-29');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(2, 5, 'Post 2: Esto es malo', '2020-06-20');  
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(3, 1, 'Post 3: Esto es excelente', '2020-05-30');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(4, 9, 'Post 4: Esto es bueno', '2020-05-09');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(5, 7, 'Post 5: Esto es bueno', '2020-07-10');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(6, 5, 'Post 6: Esto es excelente', '2020-07-18');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(7, 8, 'Post 7: Esto es excelente', '2020-07-07');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(8, 5, 'Post 8: Esto es excelente', '2020-05-14');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(9, 2, 'Post 9: Esto es bueno', '2020-05-08');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(10, 6, 'Post 10: Esto es bueno', '2020-06-02');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(11, 4, 'Post 11: Esto es bueno', '2020-05-05');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(12, 9, 'Post 12: Esto es malo', '2020-07-23');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(13, 5, 'Post 13: Esto es excelente', '2020-05-30');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(14, 8, 'Post 14: Esto es excelente', '2020-05-01');   
INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES(15, 7, 'Post 15: Esto es malo', '2020-06-17');   
-- COMENTARIOS
-- id post_id usuario_id texto fecha
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(1,6,3,'Este es el comentario 1','2020-07-08');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(2,2,4,'Este es el comentario 2','2020-06-07');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(3,4,6,'Este es el comentario 3','2020-06-16');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(4,13,2,'Este es el comentario 4','2020-06-15');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(5,6,6,'Este es el comentario 5','2020-05-14');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(6,3,3,'Este es el comentario 6','2020-07-08');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(7,1,6,'Este es el comentario 7','2020-05-22');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(8,7,6,'Este es el comentario 8','2020-07-09');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(9,13,8,'Este es el comentario 9','2020-06-30');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(10,6,8,'Este es el comentario 10','2020-06-19');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(11,1,5,'Este es el comentario 11','2020-05-09');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(12,15,8,'Este es el comentario 12','2020-06-17');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(13,9,1,'Este es el comentario 13','2020-05-01');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(14,5,2,'Este es el comentario 14','2020-05-31');
INSERT INTO comentario(id, post_id, usuario_id, texto, fecha)
VALUES(15,3,4,'Este es el comentario 15','2020-06-28');
SELECT * FROM usuario LIMIT 3;
SELECT * FROM post LIMIT 3;
SELECT * FROM comentario LIMIT 3;
-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5
SELECT u.email, u.id, p.titulo FROM usuario AS u JOIN post AS p ON p.usuario_id = u.id WHERE u.id =5;
-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.
SELECT u.email, u.id, c.texto FROM usuario AS u JOIN comentario AS c ON c.usuario_id=u.id WHERE u.email !='usuario06@hotmail.com';
-- 6. Listar los usuarios que no han publicado ningún post.
SELECT u.id, u.email FROM usuario AS u WHERE u.id NOT IN (SELECT usuario_id FROM post);
-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- comentarios).
SELECT p.titulo, p.fecha, c.texto AS Comentario, c.fecha AS Fecha_Com FROM post AS p LEFT OUTER JOIN comentario AS c ON c.post_id = p.id;
-- 8. Listar todos los usuarios que hayan publicado un post en Junio
SELECT u.email, EXTRACT(MONTH FROM p.fecha) AS mes FROM usuario AS u INNER JOIN post AS p ON p.usuario_id = u.id WHERE EXTRACT(MONTH FROM p.fecha) =6;