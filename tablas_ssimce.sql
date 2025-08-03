-- =====================================================
-- SCRIPT COMPLETO DE TABLAS PARA PROYECTO SSIMCE
-- Base de datos: ssimce_db
-- Fecha: Diciembre 2024
-- Estado: Completamente funcional
-- =====================================================

USE ssimce_db;

-- 1. TABLA: bitacora (Datos escaneados de bitacora)

CREATE TABLE `bitacora` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bitacora` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Fecha en formato flexible (dd/mes/yyyy o yyyy-mm-dd)',
  `Caja` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sello` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sello_De_Repuesto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`),
  KEY `idx_bitacora` (`Bitacora`),
  KEY `idx_fecha` (`Fecha`),
  KEY `idx_caja` (`Caja`),
  KEY `idx_sello` (`Sello`),
  KEY `idx_fecha_creacion` (`fecha_creacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2. TABLA: catalogo_productos (Productos del catálogo)

CREATE TABLE `catalogo_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `idx_sku` (`sku`),
  KEY `idx_fecha_creacion` (`fecha_creacion`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. TABLA: entradas (Registro de entradas de inventario)

CREATE TABLE `entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int NOT NULL,
  `tipo_entrada` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sku` (`sku`),
  KEY `idx_fecha` (`fecha_registro`),
  KEY `idx_tipo_entrada` (`tipo_entrada`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. TABLA: envios_ct (Envíos CT - Carga de Transporte)

CREATE TABLE `envios_ct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `ct` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tienda` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folio_ts` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo` enum('Incompleto','Dañado en exhibición','Sobrestock','No funciono al desempacar','Convenio','Enviar a Bodega','Orden de cambio') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `usuario` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `evidencia` longblob,
  `tipo_evidencia` enum('imagen','video') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_sku` (`sku`),
  KEY `idx_motivo` (`motivo`),
  KEY `idx_usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. TABLA: envios_mrb (Envíos MRB - Mercancía Recibida)

CREATE TABLE `envios_mrb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `factura_remision` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causa` enum('C-16 Acta','C-16 VP','C-15','C-15 VS','RR','RE','DV') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `usuario` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `evidencia` longblob,
  `tipo_evidencia` enum('imagen','video') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_sku` (`sku`),
  KEY `idx_causa` (`causa`),
  KEY `idx_usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. TABLA: guia (Datos de guías de transporte)

CREATE TABLE `guia` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bitacora` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Camion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Empleado` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Chofer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Origen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Destino` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Caja1` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Caja2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sello` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SelloRepuesto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_bitacora` (`Bitacora`),
  KEY `idx_fecha` (`Fecha`),
  KEY `idx_camion` (`Camion`),
  KEY `idx_empleado` (`Empleado`),
  KEY `idx_origen` (`Origen`),
  KEY `idx_destino` (`Destino`),
  KEY `idx_fecha_creacion` (`fecha_creacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. TABLA: irregularidades (Gestión de irregularidades)

CREATE TABLE `irregularidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `imagen_webp` longblob,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `sincronizado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`),
  KEY `idx_folio` (`folio`),
  KEY `idx_sku` (`sku`),
  KEY `idx_fecha` (`fecha_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8 TABLA: lineas_bitacora (datos escaneados de la bitacora)

CREATE TABLE `lineas_bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_Bitacora` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Folio` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Destino` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_id_bitacora` (`id_Bitacora`),
  KEY `idx_tipo` (`Tipo`),
  KEY `idx_folio` (`Folio`),
  KEY `idx_destino` (`Destino`),
  KEY `idx_fecha_creacion` (`fecha_creacion`),
  CONSTRAINT `lineas_bitacora_ibfk_1` FOREIGN KEY (`id_Bitacora`) REFERENCES `bitacora` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. TABLA: salidas (Registro de salidas de inventario)

CREATE TABLE `salidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folio_salida` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_salida` enum('SALIDA_NORMAL','IRREGULARIDAD') COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_sku` (`sku`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_tipo_salida` (`tipo_salida`),
  KEY `idx_folio_salida` (`folio_salida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. TABLA: usuarios (Gestión de usuarios con roles)

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `perfil` enum('admin','supervisor','rampero','operador') COLLATE utf8mb4_general_ci DEFAULT 'operador',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





-- VISTAS --

-- 1. VISTA: v_stock_disponible (Cálculo de stock disponible)

CREATE OR REPLACE VIEW v_stock_disponible AS
SELECT 
    COALESCE(e.sku, s.sku) as sku,
    COALESCE(e.descripcion, s.descripcion) as descripcion,
    COALESCE(SUM(e.cantidad), 0) as total_entradas,
    COALESCE(SUM(s.cantidad), 0) as total_salidas,
    (COALESCE(SUM(e.cantidad), 0) - COALESCE(SUM(s.cantidad), 0)) as stock_disponible
FROM (
    SELECT sku, descripcion, cantidad FROM entradas
    UNION ALL
    SELECT sku, descripcion, 0 as cantidad FROM salidas
) e
LEFT JOIN (
    SELECT sku, descripcion, cantidad FROM salidas
    UNION ALL
    SELECT sku, descripcion, 0 as cantidad FROM entradas
) s ON e.sku = s.sku
GROUP BY COALESCE(e.sku, s.sku), COALESCE(e.descripcion, s.descripcion);

-- 2. VISTA ALTERNATIVA: v_stock_disponible_alt (Vista alternativa)

CREATE OR REPLACE VIEW v_stock_disponible_alt AS
SELECT 
    COALESCE(e.sku, s.sku) as sku,
    COALESCE(e.descripcion, s.descripcion) as descripcion,
    COALESCE(SUM(e.cantidad), 0) as total_entradas,
    COALESCE(SUM(s.cantidad), 0) as total_salidas,
    (COALESCE(SUM(e.cantidad), 0) - COALESCE(SUM(s.cantidad), 0)) as stock_disponible
FROM (
    SELECT sku, descripcion, cantidad FROM entradas
    UNION ALL
    SELECT sku, descripcion, 0 as cantidad FROM salidas
) e
RIGHT JOIN (
    SELECT sku, descripcion, cantidad FROM salidas
    UNION ALL
    SELECT sku, descripcion, 0 as cantidad FROM entradas
) s ON e.sku = s.sku
GROUP BY COALESCE(e.sku, s.sku), COALESCE(e.descripcion, s.descripcion);





-- DELIMITADORES PARA CONSULTAS

-- 1. DELIMITADOR: ActualizarProducto
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto`(
    IN p_id INT,
    IN p_sku VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_imagen_url VARCHAR(255)
    )
BEGIN
    UPDATE catalogo_productos 
    SET sku = p_sku,
        descripcion = p_descripcion,
        imagen_url = p_imagen_url,
		fecha_actualizacion = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$
DELIMITER ;

-- 2. DELIMITADOR: BuscarProductoPorSKU
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarProductoPorSKU`(IN p_sku VARCHAR(50))
BEGIN
    SELECT 
        id,
        sku,
        descripcion,
        imagen_url,
        fecha_creacion,
        fecha_actualizacion
    FROM catalogo_productos 
    WHERE sku = p_sku;
END$$
DELIMITER ;

-- 3. DELIMITADOR: EliminarProducto
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto`(IN p_id INT)
BEGIN
    DELETE FROM catalogo_productos WHERE id = p_id;
END$$
DELIMITER ;

-- 4. DELIMITADOR: InsertarBitacoraCompleta
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarBitacoraCompleta`(
    IN p_id VARCHAR(50),
    IN p_bitacora VARCHAR(50),
    IN p_fecha DATE,
    IN p_caja VARCHAR(50),
    IN p_sello VARCHAR(50),
    IN p_sello_repuesto VARCHAR(50),
    IN p_lineas_serializadas TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- Insertar en tabla principal
    INSERT INTO bitacora (id, Bitacora, Fecha, Caja, Sello, Sello_De_Repuesto)
    VALUES (p_id, p_bitacora, p_fecha, p_caja, p_sello, p_sello_repuesto);
    
    -- Insertar líneas si existen
    IF p_lineas_serializadas IS NOT NULL AND p_lineas_serializadas != '' THEN
        SET @lineas = p_lineas_serializadas;
        SET @pos = 1;
        
        WHILE @pos > 0 DO
            SET @linea = SUBSTRING_INDEX(@lineas, '|', 1);
            SET @lineas = SUBSTRING(@lineas, LENGTH(@linea) + 2);
            
            IF @linea != '' THEN
                SET @tipo = SUBSTRING_INDEX(@linea, ':', 1);
                SET @resto = SUBSTRING(@linea, LENGTH(@tipo) + 2);
                SET @folio = SUBSTRING_INDEX(@resto, ':', 1);
                SET @destino = SUBSTRING(@resto, LENGTH(@folio) + 2);
                
                INSERT INTO lineas_bitacora (id_Bitacora, Tipo, Folio, Destino)
                VALUES (p_id, TRIM(@tipo), TRIM(@folio), TRIM(@destino));
            END IF;
            
            SET @pos = LOCATE('|', @lineas);
        END WHILE;
    END IF;
    
    COMMIT;
END$$
DELIMITER ;

-- 5. DELIMITADOR: InsertarBitacoraFechaFlexible
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarBitacoraFechaFlexible`(
    IN p_id VARCHAR(50),
    IN p_bitacora VARCHAR(50),
    IN p_fecha VARCHAR(20),
    IN p_fecha_original VARCHAR(50),
    IN p_caja VARCHAR(50),
    IN p_sello VARCHAR(50),
    IN p_sello_repuesto VARCHAR(50),
    IN p_lineas_serializadas TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- Insertar en tabla principal con fecha flexible
    INSERT INTO bitacora (id, Bitacora, Fecha, Fecha_Original, Caja, Sello, Sello_De_Repuesto)
    VALUES (p_id, p_bitacora, p_fecha, p_fecha_original, p_caja, p_sello, p_sello_repuesto);
    
    -- Insertar líneas si existen
    IF p_lineas_serializadas IS NOT NULL AND p_lineas_serializadas != '' THEN
        SET @lineas = p_lineas_serializadas;
        SET @pos = 1;
        
        WHILE @pos > 0 DO
            SET @linea = SUBSTRING_INDEX(@lineas, '|', 1);
            SET @lineas = SUBSTRING(@lineas, LENGTH(@linea) + 2);
            
            IF @linea != '' THEN
                SET @tipo = SUBSTRING_INDEX(@linea, ':', 1);
                SET @resto = SUBSTRING(@linea, LENGTH(@tipo) + 2);
                SET @folio = SUBSTRING_INDEX(@resto, ':', 1);
                SET @destino = SUBSTRING(@resto, LENGTH(@folio) + 2);
                
                INSERT INTO lineas_bitacora (id_Bitacora, Tipo, Folio, Destino)
                VALUES (p_id, TRIM(@tipo), TRIM(@folio), TRIM(@destino));
            END IF;
            
            SET @pos = LOCATE('|', @lineas);
        END WHILE;
    END IF;
    
    COMMIT;
END$$
DELIMITER ;


-- 6. DELIMITADOR: InsertarProducto
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
    IN p_sku VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_imagen_url VARCHAR(255)
)
BEGIN
    INSERT INTO catalogo_productos (sku, descripcion, imagen_url)
    VALUES (p_sku, p_descripcion, p_imagen_url);
    
    SELECT LAST_INSERT_ID() as id;
END$$
DELIMITER ;

-- 7. DELIMITADOR: ObtenerBitacoraPorId
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerBitacoraPorId`(IN p_id VARCHAR(50))
BEGIN
    SELECT 
        b.id,
        b.Bitacora,
        b.Fecha,
        b.Caja,
        b.Sello,
        b.Sello_De_Repuesto,
        b.fecha_creacion,
        b.fecha_actualizacion,
        lb.Tipo,
        lb.Folio,
        lb.Destino
    FROM bitacora b
    LEFT JOIN lineas_bitacora lb ON b.id = lb.id_Bitacora
    WHERE b.id = p_id
    ORDER BY lb.id ASC;
END$$
DELIMITER ;

-- 8. DELIMITADOR: ObtenerTodasBitacoras
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTodasBitacoras`()
BEGIN
    SELECT 
        b.id,
        b.Bitacora,
        b.Fecha,
        b.Caja,
        b.Sello,
        b.Sello_De_Repuesto,
        b.fecha_creacion,
        b.fecha_actualizacion,
        COUNT(lb.id) as total_lineas
    FROM bitacora b
    LEFT JOIN lineas_bitacora lb ON b.id = lb.id_Bitacora
    GROUP BY b.id
    ORDER BY b.fecha_creacion DESC;
END$$
DELIMITER ;

-- 9. DELIMITADOR: ObtenerTodosProductos
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTodosProductos`()
BEGIN
    SELECT 
        id,
        sku,
        descripcion,
        imagen_url,
        fecha_creacion,
        fecha_actualizacion
    FROM catalogo_productos 
    ORDER BY fecha_creacion DESC;
END$$
DELIMITER ;

-- 10. DELIMITADOR: sp_insertar_entrada
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_entrada`(
    IN p_sku VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_cantidad INT,
    IN p_tipo_entrada VARCHAR(100),
    IN p_observaciones TEXT,
    IN p_usuario VARCHAR(50)
)
BEGIN
    INSERT INTO entradas (sku, descripcion, cantidad, tipo_entrada, observaciones, usuario)
    VALUES (p_sku, p_descripcion, p_cantidad, p_tipo_entrada, p_observaciones, p_usuario);
    
    SELECT 'Entrada registrada exitosamente' AS mensaje;
END$$
DELIMITER ;

-- 11. DELIMITADOR: sp_insertar_irregularidad
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_irregularidad`(
    IN p_folio VARCHAR(20),
    IN p_sku VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_cantidad VARCHAR(20),
    IN p_observaciones TEXT,
    IN p_usuario VARCHAR(50)
)
BEGIN
    INSERT INTO irregularidades (folio, sku, descripcion, cantidad, observaciones, usuario)
    VALUES (p_folio, p_sku, p_descripcion, p_cantidad, p_observaciones, p_usuario);
    
    SELECT 'Irregularidad registrada exitosamente' AS mensaje;
END$$
DELIMITER ;

-- 12. DELIMITADOR: sp_insertar_salida
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_salida`(
    IN p_sku VARCHAR(50),
    IN p_descripcion VARCHAR(255),
    IN p_cantidad DECIMAL(10,2),
    IN p_usuario VARCHAR(100),
    IN p_folio_salida VARCHAR(50),
    IN p_tipo_salida ENUM('SALIDA_NORMAL', 'IRREGULARIDAD'),
    IN p_observaciones TEXT
)
BEGIN
    INSERT INTO salidas (sku, descripcion, cantidad, usuario, folio_salida, tipo_salida, observaciones)
    VALUES (p_sku, p_descripcion, p_cantidad, p_usuario, p_folio_salida, p_tipo_salida, p_observaciones);
END$$
DELIMITER ;

-- 13. DELIMITADOR: sp_obtener_stock_sku
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_stock_sku`(
    IN p_sku VARCHAR(50)
)
BEGIN
    SELECT 
        p.sku,
        p.descripcion,
        p.imagen_url,
        COALESCE(SUM(e.cantidad), 0) as total_entradas,
        COALESCE(SUM(s.cantidad), 0) as total_salidas,
        (COALESCE(SUM(e.cantidad), 0) - COALESCE(SUM(s.cantidad), 0)) as stock_disponible
    FROM catalogo_productos p
    LEFT JOIN entradas e ON p.sku = e.sku
    LEFT JOIN salidas s ON p.sku = s.sku
    WHERE p.sku = p_sku
    GROUP BY p.sku, p.descripcion, p.imagen_url;
END$$
DELIMITER ;





-- FUNCION PARA RECONOCIMIENTO DE FECHA

-- 1. FUNCION: ConvertirFechaFlexible
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `ConvertirFechaFlexible`(fecha_texto VARCHAR(50)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE fecha_convertida VARCHAR(20);
    DECLARE dia VARCHAR(2);
    DECLARE mes VARCHAR(2);
    DECLARE año VARCHAR(4);
    DECLARE mes_texto VARCHAR(20);
    
    -- Mapeo de meses
    SET @meses = JSON_OBJECT(
        'Enero', '01', 'Febrero', '02', 'Marzo', '03', 'Abril', '04',
        'Mayo', '05', 'Junio', '06', 'Julio', '07', 'Agosto', '08',
        'Septiembre', '09', 'Octubre', '10', 'Noviembre', '11', 'Diciembre', '12',
        'Ene', '01', 'Feb', '02', 'Mar', '03', 'Abr', '04',
        'May', '05', 'Jun', '06', 'Jul', '07', 'Ago', '08',
        'Sep', '09', 'Oct', '10', 'Nov', '11', 'Dic', '12'
    );
    
    -- Intentar formato dd/mes/yyyy
    IF fecha_texto REGEXP '^[0-9]{1,2}/[A-Za-z]+/[0-9]{4}$' THEN
        SET dia = SUBSTRING_INDEX(fecha_texto, '/', 1);
        SET mes_texto = SUBSTRING_INDEX(SUBSTRING_INDEX(fecha_texto, '/', 2), '/', -1);
        SET año = SUBSTRING_INDEX(fecha_texto, '/', -1);
        
        SET mes = JSON_UNQUOTE(JSON_EXTRACT(@meses, CONCAT('$.', mes_texto)));
        
        IF mes IS NOT NULL THEN
            SET fecha_convertida = CONCAT(año, '-', mes, '-', LPAD(dia, 2, '0'));
            RETURN fecha_convertida;
        END IF;
    END IF;
    
    -- Si no se pudo convertir, devolver la fecha original
    RETURN fecha_texto;
END$$
DELIMITER ;




-- DATOS DE PRUEBA (OPCIONAL)

-- Insertar algunos productos de ejemplo
INSERT INTO catalogo_productos (sku, descripcion, imagen_url) VALUES
('107443', 'Hielera Igloo Con Ruedas 98 Latas', 'http://localhost/imagenes/107443.webp'),
('637165', 'Lavadora Mabe Automática LMA70215VBAB0 20 kg Blanca', 'http://localhost/imagenes/637165.webp')
ON DUPLICATE KEY UPDATE descripcion = VALUES(descripcion);





-- VERIFICACIÓN DE TABLAS CREADAS

-- Mostrar todas las tablas creadas
SELECT TABLE_NAME, TABLE_ROWS, ENGINE, TABLE_COLLATION 
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = 'ssimce_db' 
ORDER BY TABLE_NAME;

-- Mostrar estructura de las vistas
SELECT TABLE_NAME, VIEW_DEFINITION 
FROM information_schema.VIEWS 
WHERE TABLE_SCHEMA = 'ssimce_db';



-- =====================================================
-- NOTAS IMPORTANTES
-- =====================================================

/*
1. TABLAS PRINCIPALES:	
   - catalogo_productos: Sin campo de imagen
   - bitacora: obtención de datos con OCR
   - usuarios: Con roles y permisos
   - entradas: Con tipos específicos
   - salidas: Con validación de stock
   - irregularidades: Con evidencia multimedia
   - guia: obtención de datos con OCR
   - envios_mrb: Envíos MRB con evidencia
   - envios_ct: Envíos CT con evidencia

2. VISTAS:
   - v_stock_disponible: Cálculo de stock disponible
   - v_stock_disponible_alt: Vista alternativa

3. FUNCIONALIDADES:
   - CRUD completo para productos y usuarios
   - Gestión de entradas y salidas
   - Control de irregularidades
   - Envíos con evidencia multimedia
   - Cálculo automático de stock
*/

-- =====================================================
-- FIN DEL SCRIPT
-- ===================================================== 