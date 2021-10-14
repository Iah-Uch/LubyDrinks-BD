/* LubyDrinks: */

CREATE DATABASE IF NOT EXISTS LubyDrinks;

USE LubyDrinks;

CREATE TABLE material (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE tipo_bebida (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE produtor (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE harmonizacao (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    id_tipo_harmonizacao INTEGER
);

CREATE TABLE tipo_harmonizacao (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    foto VARCHAR(100) DEFAULT NULL
);

CREATE TABLE pais_origem (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

CREATE TABLE tipo_loja (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

CREATE TABLE loja (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    avaliacao DOUBLE NOT NULL,
    id_tipo_loja INTEGER,
    FOREIGN KEY (id_tipo_loja) REFERENCES tipo_loja(id)
);

CREATE TABLE usuario (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(80) NOT NULL,
    telefone VARCHAR(80) NOT NULL,
    senha VARCHAR(80) DEFAULT NULL
);

CREATE TABLE bebida (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    teor DOUBLE NOT NULL,
    tempo_envazamento DATE NOT NULL,
    litragem DOUBLE NOT NULL,
    temperatura_servico VARCHAR(20) NOT NULL,
    id_produtor INTEGER NOT NULL,
    id_tipo_bebida INTEGER NOT NULL,
    id_pais_origem INTEGER NOT NULL,
    FOREIGN KEY (id_produtor) REFERENCES produtor(id),
    FOREIGN KEY (id_tipo_bebida) REFERENCES tipo_bebida(id),
    FOREIGN KEY (id_pais_origem) REFERENCES pais_origem(id)
);
    
    CREATE TABLE usuario_bebida (
	id_bebida INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    PRIMARY KEY (id_bebida, id_usuario)
);

CREATE TABLE bebida_material (
	id_bebida INTEGER NOT NULL,
    id_material INTEGER NOT NULL,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_material) REFERENCES material(id),
    PRIMARY KEY (id_bebida, id_material)
);

CREATE TABLE bebida_harmonizacao (
	id_bebida INTEGER NOT NULL,
    id_harmonizacao INTEGER NOT NULL,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_harmonizacao) REFERENCES harmonizacao(id),
    PRIMARY KEY (id_bebida, id_harmonizacao)
);

CREATE TABLE bebida_disponivel (
	id_loja INTEGER NOT NULL,
    id_bebida INTEGER NOT NULL,
    FOREIGN KEY (id_loja) REFERENCES loja(id),
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
	PRIMARY KEY (id_loja, id_bebida),
	preco DOUBLE NOT NULL
);