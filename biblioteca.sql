-- -//////////////////// CREACION DE ENTIDADES ////////////////////-
-- Tabla USUARIO
CREATE TABLE USUARIO (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    telefono VARCHAR(50) NOT NULL, 
    direccion VARCHAR(50) NOT NULL
)ENGINE=InnoDB;
-- Tabla CATEGORÍA
CREATE TABLE CATEGORIA (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
)ENGINE=InnoDB;
-- Tabla LIBRO
CREATE TABLE LIBRO (
    libro_id INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(50) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    año YEAR NOT NULL,
    ejemplares INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY(categoria_id) REFERENCES CATEGORIA(categoria_id)
)ENGINE=InnoDB;
-- Tabla AUTOR
CREATE TABLE AUTOR (
    autor_id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    nacionalidad VARCHAR(50) NOT NULL
)ENGINE=InnoDB;
-- Tabla LIBRO_AUTOR
CREATE TABLE LIBRO_AUTOR (
    libro_autor_id INT AUTO_INCREMENT PRIMARY KEY, 
    libro_id INT NOT NULL,
    FOREIGN KEY(libro_id) REFERENCES LIBRO(libro_id),
    autor_id INT NOT NULL,
    FOREIGN KEY(autor_id) REFERENCES AUTOR(autor_id)
)ENGINE=InnoDB;
-- Tabla PRÉSTAMO
CREATE TABLE PRESTAMO (
    prestamo_id INT AUTO_INCREMENT PRIMARY KEY, 
    usuario_id INT NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES USUARIO(usuario_id),
    libro_id INT NOT NULL,
    FOREIGN KEY(libro_id) REFERENCES LIBRO(libro_id),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('disponible', 'no_disponible') DEFAULT 'no_disponible'
)ENGINE=InnoDB;

-- -//////////////////// INSERCION DE DATOS ////////////////////-
-- Autores
INSERT INTO AUTOR (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('J.K. Rowling', 'Británica'),
('Mario Vargas Llosa', 'Peruano');
-- Usuarios
INSERT INTO USUARIO (nombre, email, telefono, direccion) VALUES
('Ana Pérez', 'ana.perez@mail.com', '3001234567', 'Calle 123, Cali'),
('Juan Gómez', 'juan.gomez@mail.com', '3107654321', 'Carrera 45, Bogotá'),
('María López', 'maria.lopez@mail.com', '3209988776', 'Av. Siempre Viva 742'),
('Luis Torres', 'luis.torres@mail.com', '3001112233', 'Calle 8 #45-67, Medellín'),
('Sofía Ríos', 'sofia.rios@mail.com', '3159998888', 'Cl. 10 #12-34, Barranquilla'),
('Carlos Mendoza', 'carlos.mendoza@mail.com', '3165554433', 'Calle 20 #10-20, Cali'),
('Laura Sánchez', 'laura.sanchez@mail.com', '3176665544', 'Carrera 30 #15-40, Bogotá'),
('Pedro Ramírez', 'pedro.ramirez@mail.com', '3187776655', 'Cl. 50 #20-10, Medellín'),
('Marta Díaz', 'marta.diaz@mail.com', '3198887766', 'Av. 5 #25-30, Barranquilla'),
('Diego Fernández', 'diego.fernandez@mail.com', '3209998877', 'Calle 100 #40-50, Cali');
-- Categorías
INSERT INTO CATEGORIA (nombre, descripcion) VALUES
('Novela', 'Libros de narrativa literaria.'),
('Ciencia Ficción', 'Libros con temáticas futuristas y tecnológicas.'),
('Fantasía', 'Libros con elementos mágicos y mundos imaginarios.'),
('Ensayo', 'Libros con análisis y reflexiones sobre diversos temas.');
-- Libros
INSERT INTO LIBRO (titulo, isbn, año, ejemplares, categoria_id) VALUES
('Cien Años de Soledad', '9780307474728', 1967, 10, 1),
('El Amor en los Tiempos del Cólera', '9780307389732', 1985, 8, 1),
('La Casa de los Espíritus', '9780553383805', 1982, 5, 3),
('Harry Potter y la Piedra Filosofal', '9780747532699', 1997, 15, 3),
('Harry Potter y la Cámara Secreta', '9780747538493', 1998, 12, 3),
('1984', '9780451524935', 1949, 7, 2),
('Fahrenheit 451', '9781451673319', 1953, 6, 2),
('El Juego de Ender', '9780812550702', 1985, 9, 2),
('Ensayo sobre la Ceguera', '9788497592208', 1995, 4, 4),
('La Ciudad y los Perros', '9780143105138', 1963, 6, 1),
('El Héroe de las Eras', '9780765326355', 2010, 10, 3),
('El Nombre del Viento', '9780756404741', 2007, 8, 3),
('Crónica de una Muerte Anunciada', '9780307389733', 1981, 5, 1),
('El Señor de los Anillos', '9780618640157', 1954, 14, 3),
('El Principito', '9780156012195', 1943, 20, 1),
('La Sombra del Viento', '9788408130995', 2001, 11, 1),
('El Aleph', '9789504918396', 1949, 7, 4),
('La Tregua', '9789504918397', 1960, 9, 1);

-- -//////////////////// INSERCION DE DATOS RELACIONES ////////////////////-
-- Relacion LIBRO_AUTOR
INSERT INTO LIBRO_AUTOR (libro_id, autor_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 4),
(8, 4),
(9, 1),
(10, 4),
(11, 3),
(12, 3),
(13, 1),
(14, 3),
(15, 2),
(16, 1),
(17, 1),
(18, 4);
-- Relacion PRESTAMO
INSERT INTO PRESTAMO (usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 1, '2025-05-01', '2025-05-15', 'disponible'),
(2, 4, '2025-05-02', NULL, 'no_disponible'),
(3, 3, '2025-04-20', '2025-05-05', 'disponible'),
(4, 5, '2025-05-10', NULL, 'no_disponible'),
(5, 7, '2025-05-12', '2025-05-22', 'disponible'),
(6, 9, '2025-05-13', NULL, 'no_disponible'),
(7, 11, '2025-05-14', '2025-05-25', 'disponible'),
(8, 13, '2025-05-15', NULL, 'no_disponible'),
(9, 15, '2025-05-16', '2025-05-30', 'disponible'),
(10, 16, '2025-05-17', NULL, 'no_disponible');

-- -//////////////////// CONSULTAS ////////////////////-
-- Consulta 1
SELECT
    l.titulo AS nombre_libro,
    a.nombre AS nombre_autor
FROM
	libro_autor la
INNER JOIN
	libro l
ON 
	la.libro_id = l.libro_id
INNER JOIN
	autor a
ON
	la.autor_id = a.autor_id;
-- Consulta 2
SELECT
    a.nombre AS nombre_autor,
    COUNT(l.libro_id) AS numero_libros
FROM
	libro_autor la
INNER JOIN
	libro l
ON 
	la.libro_id = l.libro_id
INNER JOIN
	autor a
ON
	la.autor_id = a.autor_id
GROUP BY
	a.nombre;
-- Consulta 3
SELECT
    COUNT(l.titulo) AS cantidad_libros,
    SUM(l.ejemplares) AS cantidad_ejemplares
FROM
	libro l;
-- Consulta 4
SELECT
l.titulo AS nombre_libro,
c.nombre AS nombre_categoria
FROM
libro l
INNER JOIN
categoria c
ON l.categoria_id = c.categoria_id;
-- Consulta 5
select count(*) from prestamo
where estado = true;
-- Consulta 6
select titulo , fecha_prestamo from libro 
left join prestamo on libro.libro_id = prestamo.libro_id;
-- Consulta 7
SELECT
ca.nombre AS nombre_categoria,
COUNT(li.libro_id) AS total_libros,
SUM(li.ejemplares) AS total_ejemplares
FROM
categoria ca
LEFT JOIN
libro li
ON
li.categoria_id = ca.categoria_id
GROUP BY
ca.nombre;
-- Consulta 8
SELECT
u.nombre,
l.titulo,
pr.fecha_devolucion
FROM
prestamo pr
LEFT JOIN
usuario u
ON
pr.usuario_id = u.usuario_id
LEFT JOIN
libro l
ON
pr.libro_id = l.libro_id;
-- Consulta 9
SELECT L.titulo, A.nombre AS autor
FROM libro L
JOIN libro_autor LA ON L.libro_id = LA.libro_id
JOIN autor A ON LA.autor_id = A.autor_id
WHERE A.nacionalidad = 'Británica';
-- Consulta 10
SELECT titulo, año
FROM libro
WHERE año BETWEEN 1990 AND 2010;
-- Consulta 11
SELECT titulo
FROM libro
WHERE libro_id IN (
    SELECT libro_id
    FROM prestamo
    WHERE fecha_prestamo BETWEEN '2025-04-05' AND '2025-05-12'
);
-- Consulta 12
SELECT L.titulo, P.fecha_prestamo
FROM prestamo P
JOIN libro L ON P.libro_id = L.libro_id
WHERE P.estado = 'disponible';
-- Consulta 13
select avg(ejemplares) as promedio_libros from libro;
-- Consulta 14
select sum(ejemplares) as total_libros from libro;
-- Consulta 15
SELECT p.prestamo_id, u.Nombre AS Usuario, l.Titulo AS Libro, p.Fecha_prestamo, p.Estado
FROM prestamo p
INNER JOIN usuario u ON p.usuario_id = u.usuario_id
INNER JOIN libro l ON p.libro_id = l.libro_id;
-- Consulta 16
SELECT
ca.nombre AS nombre_categoria,
SUM(li.ejemplares) AS cantidad_ejemplares
FROM
libro li
LEFT JOIN
categoria ca
ON
li.categoria_id = ca.categoria_id
GROUP BY
ca.nombre;

