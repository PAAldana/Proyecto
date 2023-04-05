-- SQLINES DEMO *** orward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'; */

-- SQLINES DEMO *** ------------------------------------
-- Schema dpir
-- SQLINES DEMO *** ------------------------------------

-- SQLINES DEMO *** ------------------------------------
-- Schema dpir
-- SQLINES DEMO *** ------------------------------------
CREATE SCHEMA IF NOT EXISTS dpir DEFAULT CHARACTER SET utf8 ;
SET SCHEMA 'dpir' ;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Productos`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Productos_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Productos (
  Producto_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Productos_seq'),
  Cod_INE VARCHAR(45) NOT NULL,
  Nombre VARCHAR(255) NOT NULL,
  Especificaciones TEXT NOT NULL,
  timestamp TIMESTAMP(0) NOT NULL DEFAULT Now(),
  PRIMARY KEY (Producto_FK),
  CONSTRAINT Cod_INE_UNIQUE UNIQUE (Cod_INE) VISIBLE)
ENGINE = InnoDB
COMMENT = '			';


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Proveedor`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Proveedor_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Proveedor (
  Proveedor_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Proveedor_seq'),
  NIT INT NOT NULL,
  Nombre VARCHAR(255) NOT NULL,
  Direccion VARCHAR(255) NULL,
  Teléfono VARCHAR(45) NULL,
  e-mail VARCHAR(45) NULL,
  Comentarios TEXT NULL,
  Sector VARCHAR(45) NOT NULL,
  timestamp TIMESTAMP(0) NOT NULL DEFAULT now(),
  PRIMARY KEY (Proveedor_FK),
  CONSTRAINT NIT_UNIQUE UNIQUE (NIT) VISIBLE)
ENGINE = InnoDB;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Fuente`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Fuente_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Fuente (
  Fuente_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Fuente_seq'),
  FuenteDatos VARCHAR(45) NOT NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PRIMARY KEY (Fuente_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Rubro`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Rubro_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Rubro (
  Rubro_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Rubro_seq'),
  Rubro VARCHAR(45) NOT NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PRIMARY KEY (Rubro_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Medida`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Medida_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Medida (
  Medida_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Medida_seq'),
  UnidadMedida VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45) NOT NULL,
  Dimensional VARCHAR(10) NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PRIMARY KEY (Medida_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Entidad`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Entidad_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Entidad (
  Entidad_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Entidad_seq'),
  Nombre VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45) NULL,
  Sub_Tipo VARCHAR(45) NULL,
  Unidad_Compradora VARCHAR(45) NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PRIMARY KEY (Entidad_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Date`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS dpir.DIM_Date (
  Date_key INT NOT NULL,
  Fecha DATE NULL,
  Mes VARCHAR(45) NULL,
  Año INT NULL,
  Mes_Año VARCHAR(45) NULL,
  Fecha +40d DATE NULL,
  PRIMARY KEY (Date_key))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Adquisicion`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Adquisicion_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Adquisicion (
  Adquisicion_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Adquisicion_seq'),
  Tipo_Adquisicion VARCHAR(45) NOT NULL,
  timestamp TIMESTAMP(0) NOT NULL DEFAULT now(),
  PRIMARY KEY (Adquisicion_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Divisas`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.DIM_Divisas_seq;

CREATE TABLE IF NOT EXISTS dpir.DIM_Divisas (
  Divisa_FK INT NOT NULL DEFAULT NEXTVAL ('dpir.DIM_Divisas_seq'),
  Divisa VARCHAR(45) NULL,
  Abreviatura VARCHAR(5) NULL,
  Símbolo VARCHAR(5) NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PRIMARY KEY (Divisa_FK))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** T_Precio`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.FACT_Precio_seq;

CREATE TABLE IF NOT EXISTS dpir.FACT_Precio (
  Precio_ID INT NOT NULL DEFAULT NEXTVAL ('dpir.FACT_Precio_seq'),
  Producto_FK INT NOT NULL,
  Proveedor_FK INT NOT NULL,
  Fuente_FK INT NOT NULL,
  Medida_FK INT NOT NULL,
  Date_key INT NOT NULL,
  Divisa_FK INT NOT NULL,
  Precio DECIMAL(10) NOT NULL,
  Marca VARCHAR(45) NULL,
  Pais VARCHAR(45) NULL,
  NOG VARCHAR(45) NULL,
  Responsable VARCHAR(45) NULL,
  Observaciones TEXT NULL,
  timestamp TIMESTAMP(0) NOT NULL DEFAULT now(),
  PRIMARY KEY (Precio_ID, Producto_FK, Proveedor_FK, Fuente_FK, Medida_FK)
  CREATE INDEX ProductoPrecio_idx ON dpir.FACT_Precio (Producto_FK ASC) VISIBLE,
  INDEX ProveedorPrecio_idx (Proveedor_FK ASC) VISIBLE,
  INDEX FuentePrecio_idx (Fuente_FK ASC) VISIBLE,
  INDEX MedidaPrecio_idx (Medida_FK ASC) VISIBLE,
  INDEX FechaPrecio_idx (Date_key ASC) VISIBLE,
  INDEX DivisaPrecio_idx (Divisa_FK ASC) VISIBLE,
  CONSTRAINT ProductoPrecio
    FOREIGN KEY (Producto_FK)
    REFERENCES dpir.DIM_Productos (Producto_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ProveedorPrecio
    FOREIGN KEY (Proveedor_FK)
    REFERENCES dpir.DIM_Proveedor (Proveedor_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FuentePrecio
    FOREIGN KEY (Fuente_FK)
    REFERENCES dpir.DIM_Fuente (Fuente_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT MedidaPrecio
    FOREIGN KEY (Medida_FK)
    REFERENCES dpir.DIM_Medida (Medida_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FechaPrecio
    FOREIGN KEY (Date_key)
    REFERENCES dpir.DIM_Date (Date_key)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT DivisaPrecio
    FOREIGN KEY (Divisa_FK)
    REFERENCES dpir.DIM_Divisas (Divisa_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _Evento`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS dpir.DIM_Evento (
  Evento_FK INT NOT NULL,
  NOG INT NOT NULL,
  Nombre VARCHAR(255) NULL,
  Enlace VARCHAR(45) NULL,
  Entidad INT NOT NULL,
  Adquisición_FK INT NOT NULL,
  Date_Key INT NOT NULL,
  PRIMARY KEY (Evento_FK)
  CREATE INDEX Date_Evento_idx ON dpir.DIM_Evento (Date_Key ASC) VISIBLE,
  INDEX Entidad_Evento_idx (Entidad ASC) VISIBLE,
  INDEX Adquisicion_Evento_idx (Adquisición_FK ASC) VISIBLE,
  CONSTRAINT Date_Evento
    FOREIGN KEY (Date_Key)
    REFERENCES dpir.DIM_Date (Date_key)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Entidad_Evento
    FOREIGN KEY (Entidad)
    REFERENCES dpir.DIM_Entidad (Entidad_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Adquisicion_Evento
    FOREIGN KEY (Adquisición_FK)
    REFERENCES dpir.DIM_Adquisicion (Adquisicion_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** T_Catalogo`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE dpir.FACT_Catalogo_seq;

CREATE TABLE IF NOT EXISTS dpir.FACT_Catalogo (
  Catalogo_ID INT NOT NULL DEFAULT NEXTVAL ('dpir.FACT_Catalogo_seq'),
  Revision INT NOT NULL,
  Evento_FK INT NOT NULL,
  Renglon INT NOT NULL,
  Producto_FK INT NOT NULL,
  Medida_FK INT NOT NULL,
  Cantidad INT NULL,
  Rubro_FK INT NOT NULL,
  timestamp TIMESTAMP(0) NULL DEFAULT now(),
  PR DECIMAL(10,2) NULL,
  Date_key INT NULL,
  Observaciones VARCHAR(45) NULL,
  PRIMARY KEY (Catalogo_ID, Revision, Evento_FK, Renglon, Producto_FK, Medida_FK)
  CREATE INDEX EventoProducto_idx ON dpir.FACT_Catalogo (Producto_FK ASC) VISIBLE,
  INDEX EventoRubro_idx (Rubro_FK ASC) VISIBLE,
  INDEX EventoMedida_idx (Medida_FK ASC) VISIBLE,
  INDEX EventoCatalogo_idx (Evento_FK ASC) VISIBLE,
  CONSTRAINT EventoProducto
    FOREIGN KEY (Producto_FK)
    REFERENCES dpir.DIM_Productos (Producto_FK)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT EventoRubro
    FOREIGN KEY (Rubro_FK)
    REFERENCES dpir.DIM_Rubro (Rubro_FK)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT EventoMedida
    FOREIGN KEY (Medida_FK)
    REFERENCES dpir.DIM_Medida (Medida_FK)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT EventoCatalogo
    FOREIGN KEY (Evento_FK)
    REFERENCES dpir.DIM_Evento (Evento_FK)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */
