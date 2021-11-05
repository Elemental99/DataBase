-- Creacion de tablas e indices

CREATE DATABASE SEGURO_VIDA;

CREATE TABLE ESTADO (
    ID_EST INT,
    ESTADO_EST VARCHAR(60),
    FECHA_EST DATE,
    CONSTRAINT PK_ID_ESTADO PRIMARY KEY (ID_EST)
);

--Index ESTADO_PK
CREATE UNIQUE INDEX ESTADO_PK on ESTADO (
	ID_EST
);

CREATE TABLE LIQUIDACION (
	ID_LIQUI INT,
    NOM_BENE VARCHAR(60),
    CONSTRAINT PK_ID_LIQUIDACION PRIMARY KEY (ID_LIQUI)
);

--Index LIQUIDACION_PK
CREATE UNIQUE INDEX LIQUIDACION_PK on LIQUIDACION (
	ID_LIQUI
);

CREATE TABLE AGENTE_VENDEDOR (
	ID_AGENT INT,
    NOM_AGENT VARCHAR(60),
    FECH_CONTR DATE,
    LUGAR_CONTR VARCHAR(60),
    DOCUMENT_CONTR VARCHAR(60),
	PAGO_AGENT INT,
    CONSTRAINT PK_ID_AGENTE PRIMARY KEY (ID_AGENT)
);

--Index AGENTE_VENDEDOR_PK
CREATE UNIQUE INDEX AGENTE_VENDEDOR_PK on AGENTE_VENDEDOR (
	ID_AGENT
);

CREATE TABLE TIPO_CONTRATO (
	ID_TIP INT,
    NOM_TIP VARCHAR(60),
    REQUI_TIP VARCHAR(60),
    CONSTRAINT PK_ID_TIPO PRIMARY KEY (ID_TIP)
);

--Index TIPO_CONTRATO_PK
CREATE UNIQUE INDEX TIPO_CONTRATO_PK on TIPO_CONTRATO (
	ID_TIP
);

CREATE TABLE PAGO (
	ID_PAGO INT,
    ID_REG INT,
    TIPO_PAGO VARCHAR(60),
    COSTO_PAGO INT,
    CONSTRAINT PK_ID_PAGO PRIMARY KEY (ID_PAGO)
);

--Index PAGO_PK
CREATE UNIQUE INDEX PAGO_PK on PAGO (
	ID_PAGO
);

--Index RELACION_1_FK
CREATE INDEX RELACION_1_FK on PAGO (
	ID_REG
);

CREATE TABLE CLIENTE (
	ID_CLIEN INT,
    ID_LUGAR INT,
    NOM_CLIEN VARCHAR(60),
    APELL_CLIEN VARCHAR(60),
    FECHANAC_CLIEN DATE,
    TEL1_CLIEN INT,
    TEL2_CLIEN INT,
    TIPOSANGRE_CLIEN VARCHAR(60),
    CONSTRAINT PK_ID_CLIENTE PRIMARY KEY (ID_CLIEN)
);

--Index CLIENTE_PK
CREATE UNIQUE INDEX CLIENTE_PK on CLIENTE (
	ID_CLIEN
);

--Index RELACION_2_FK
CREATE INDEX RELACION_2_FK on CLIENTE (
	ID_LUGAR
);

CREATE TABLE LUGAR_DE_NACIMIENTO (
	ID_LUG INT,
    PAIS_LUG VARCHAR(60),
    CIUDAD_LUG VARCHAR(60),
    CANTON_LUG VARCHAR(60),
    CONSTRAINT PK_ID_LUGAR PRIMARY KEY (ID_LUG)
);

--Index LUGAR_PK
CREATE UNIQUE INDEX LUGAR_PK on LUGAR_DE_NACIMIENTO (
	ID_LUG
);

CREATE TABLE PAGO_MENSUALIDAD (
    ID_PAGM INT,
    ID_REG INT,
    INST_BANC VARCHAR(60),
    FECHA_PAGM DATE,
	COSTO_PAGM INT,
    CONSTRAINT PK_ID_PAGOM PRIMARY KEY (ID_PAGM)
);

--Index PAGO_MENSUALIDAD_PK
CREATE UNIQUE INDEX PAGO_MENSUALIDAD_PK on PAGO_MENSUALIDAD (
	ID_PAGM
);

--Index RELACION_3_FK
CREATE INDEX RELACION_3_FK on PAGO_MENSUALIDAD (
	ID_REG
);

CREATE TABLE REGISTRO (
	ID_REG INT,
    ID_AGENT INT,
    ID_TIP INT,
    ID_EST INT,
    ID_CLIEN INT,
    ID_LIQ INT,
    FECHINI_REG DATE,
    ESTASALUD_CLIEN VARCHAR(60),
    OBSERESTAD_CLIEN VARCHAR(60),
    FECHAVENCI_EST DATE,
    NUM_CONTR INT,
    CONSTRAINT PK_ID_REGISTRO PRIMARY KEY (ID_REG)
);

--Index REGISTRO_PK
CREATE UNIQUE INDEX REGISTRO_PK on REGISTRO (
	ID_REG
);

--Index RELACION_4_FK
CREATE INDEX RELACION_4_FK on REGISTRO (
	ID_AGENT
);

--Index RELACION_5_FK
CREATE INDEX RELACION_5_FK on REGISTRO (
	ID_TIP
);

--Index RELACION_6_FK
CREATE INDEX RELACION_6_FK on REGISTRO (
	ID_EST
);

--Index RELACION_7_FK
CREATE INDEX RELACION_7_FK on REGISTRO (
	ID_CLIEN
);

--Index RELACION_8_FK
CREATE INDEX RELACION_8_FK on REGISTRO (
	ID_LIQ
);
