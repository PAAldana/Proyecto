create_pr_dw = '''


-- Table dim_productos

DROP TABLE IF EXISTS dim_productos CASCADE;

CREATE TABLE IF NOT EXISTS dim_productos (
Producto_FK SERIAL PRIMARY KEY,
Cod_INE VARCHAR(45) NOT NULL,
Nombre VARCHAR(255) NOT NULL,
Especificaciones TEXT NOT NULL,
timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT Cod_INE_UNIQUE UNIQUE (Cod_INE)
);

-- Table dim_proveedor

DROP TABLE IF EXISTS dim_proveedor CASCADE;

CREATE TABLE IF NOT EXISTS dim_proveedor (
Proveedor_FK SERIAL PRIMARY KEY,
NIT VARCHAR(10) NOT NULL,
Nombre VARCHAR(255) NOT NULL,
Direccion VARCHAR(255),
"Teléfono" VARCHAR(45),
"e-mail" VARCHAR(45),
Comentarios TEXT,
Sector VARCHAR(45) NOT NULL,
timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT NIT_UNIQUE UNIQUE (NIT)
);

-- Table dim_fuente

DROP TABLE IF EXISTS dim_fuente CASCADE;

CREATE TABLE IF NOT EXISTS dim_fuente (
Fuente_FK SERIAL PRIMARY KEY,
FuenteDatos VARCHAR(45) NOT NULL,
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table DIM_Rubro

DROP TABLE IF EXISTS dim_rubro CASCADE;

CREATE TABLE IF NOT EXISTS DIM_Rubro (
Rubro_FK SERIAL PRIMARY KEY,
Rubro VARCHAR(100) NOT NULL,
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table dim_medida

DROP TABLE IF EXISTS dim_medida CASCADE;

CREATE TABLE IF NOT EXISTS dim_medida (
Medida_FK SERIAL PRIMARY KEY,
UnidadMedida VARCHAR(45) NOT NULL,
Tipo VARCHAR(45) NOT NULL,
Dimensional VARCHAR(10),
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table dim_entidad

DROP TABLE IF EXISTS dim_entidad CASCADE;

CREATE TABLE IF NOT EXISTS dim_entidad (
Entidad_FK SERIAL PRIMARY KEY,
Nombre VARCHAR(45) NOT NULL,
Tipo VARCHAR(45),
Sub_Tipo VARCHAR(45),
Unidad_Compradora VARCHAR(45),
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table dim_date

DROP TABLE IF EXISTS dim_date CASCADE;

CREATE TABLE IF NOT EXISTS dim_date (
Date_key INTEGER PRIMARY KEY,
Fecha DATE,
Mes VARCHAR(45),
Año INTEGER,
Mes_Año VARCHAR(45),
"Fecha +40d" DATE
);

-- Table dim_adquisicion

DROP TABLE IF EXISTS dim_adquisicion CASCADE;

CREATE TABLE IF NOT EXISTS dim_adquisicion (
Adquisicion_FK SERIAL PRIMARY KEY,
Tipo_Adquisicion VARCHAR(45) NOT NULL,
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table dim_divisas

DROP TABLE IF EXISTS dim_divisas CASCADE;

CREATE TABLE IF NOT EXISTS dim_divisas (
Divisa_FK SERIAL PRIMARY KEY,
Divisa VARCHAR(45),
Abreviatura VARCHAR(5),
"Símbolo" VARCHAR(5),
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table fact_precio

DROP TABLE IF EXISTS fact_precio CASCADE;

CREATE TABLE IF NOT EXISTS fact_precio (
Precio_ID SERIAL,
Producto_FK INT NOT NULL,
Proveedor_FK INT NOT NULL,
Fuente_FK INT NOT NULL,
Medida_FK INT NOT NULL,
Date_key INT NOT NULL,
Divisa_FK INT NOT NULL,
Precio DECIMAL(10,2) NOT NULL,
Marca VARCHAR(45),
Pais VARCHAR(45),
NOG VARCHAR(45),
Responsable VARCHAR(45),
Observaciones TEXT,
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (Precio_ID, Producto_FK, Proveedor_FK, Fuente_FK, Medida_FK),
CONSTRAINT ProductoPrecio
FOREIGN KEY (Producto_FK)
REFERENCES dim_productos (Producto_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT ProveedorPrecio
FOREIGN KEY (Proveedor_FK)
REFERENCES dim_proveedor (Proveedor_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT FuentePrecio
FOREIGN KEY (Fuente_FK)
REFERENCES dim_fuente (Fuente_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT MedidaPrecio
FOREIGN KEY (Medida_FK)
REFERENCES dim_medida (Medida_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT FechaPrecio
FOREIGN KEY (Date_key)
REFERENCES dim_date (Date_key)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT DivisaPrecio
FOREIGN KEY (Divisa_FK)
REFERENCES dim_divisas (Divisa_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE INDEX ProductoPrecio_idx ON fact_precio (Producto_FK);
CREATE INDEX PrveedorPrecio_idx ON fact_precio (Proveedor_FK);
CREATE INDEX FuentePrecio_idx ON fact_precio (Fuente_FK);
CREATE INDEX FechaPrecio_idx ON fact_precio (Date_key);
CREATE INDEX DivisaPrecio_idx ON fact_precio (Divisa_FK);

-- Table dim_evento

DROP TABLE IF EXISTS dim_evento CASCADE;

CREATE TABLE IF NOT EXISTS dim_evento (
Evento_FK INT NOT NULL,
NOG INT NOT NULL,
Nombre VARCHAR(255) NULL,
Enlace VARCHAR(45) NULL,
Entidad INT NOT NULL,
Adquisición_FK INT NOT NULL,
Date_Key INT NOT NULL,
PRIMARY KEY (Evento_FK),
CONSTRAINT Date_Evento
FOREIGN KEY (Date_Key)
REFERENCES dim_date(Date_key)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Entidad_Evento
FOREIGN KEY (Entidad)
REFERENCES dim_entidad(Entidad_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Adquisicion_Evento
FOREIGN KEY (Adquisición_FK)
REFERENCES dim_adquisicion(Adquisicion_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE INDEX Date_Evento_idx ON dim_evento (Date_Key);
CREATE INDEX Entidad_Evento_idx ON dim_evento (Entidad);
CREATE INDEX Adquisicion_Evento_idx ON dim_evento (Adquisición_FK);

-- Table FACT_Catalogo

DROP TABLE IF EXISTS FACT_Catalogo CASCADE;

CREATE TABLE IF NOT EXISTS FACT_Catalogo (
Catalogo_ID SERIAL PRIMARY KEY,
Revision INT NOT NULL,
Evento_FK INT NOT NULL,
Renglon INT NOT NULL,
Producto_FK INT NOT NULL,
Medida_FK INT NOT NULL,
Cantidad INT NULL,
Rubro_FK INT NOT NULL,
timestamp TIMESTAMP NULL DEFAULT NOW(),
PR DECIMAL(10,2) NULL,
Date_key INT NULL,
Observaciones VARCHAR(45) NULL,
CONSTRAINT EventoProducto
FOREIGN KEY (Producto_FK)
REFERENCES DIM_Productos (Producto_FK)
ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT EventoRubro
FOREIGN KEY (Rubro_FK)
REFERENCES DIM_Rubro (Rubro_FK)
ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT EventoMedida
FOREIGN KEY (Medida_FK)
REFERENCES DIM_Medida (Medida_FK)
ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT EventoCatalogo
FOREIGN KEY (Evento_FK)
REFERENCES DIM_Evento (Evento_FK)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE INDEX EventoProducto_idx ON FACT_Catalogo (Producto_FK);
CREATE INDEX EventoRubro_idx ON FACT_Catalogo (Rubro_FK);
CREATE INDEX EventoMedida_idx ON FACT_Catalogo (Medida_FK);
CREATE INDEX EventoCatalogo_idx ON FACT_Catalogo (Evento_FK);

'''