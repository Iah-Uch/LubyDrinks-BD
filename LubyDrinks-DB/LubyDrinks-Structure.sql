/* LubyDrinks: */

CREATE DATABASE IF NOT EXISTS LubyDrinks;

USE LubyDrinks;

CREATE TABLE material (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE tipo_bebida (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE produtor (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE harmonizacao (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    id_tipo_harmonizacao INTEGER
);

CREATE TABLE tipo_harmonizacao (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    foto VARCHAR(100) DEFAULT NULL
);

CREATE TABLE pais_origem (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE tipo_loja (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE loja (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    avaliacao DOUBLE,
    id_tipo_loja INTEGER,
    FOREIGN KEY (id_tipo_loja) REFERENCES tipo_loja(id)
);

CREATE TABLE usuario (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    email VARCHAR(80),
    telefone VARCHAR(80),
    senha VARCHAR(80)
);

CREATE TABLE bebida (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    teor DOUBLE,
    tempo_envazamento DATE,
    litragem DOUBLE,
    temperatura_servico VARCHAR(20),
    id_produtor INTEGER,
    id_tipo_bebida INTEGER,
    id_pais_origem INTEGER,
    FOREIGN KEY (id_produtor) REFERENCES produtor(id),
    FOREIGN KEY (id_tipo_bebida) REFERENCES tipo_bebida(id),
    FOREIGN KEY (id_pais_origem) REFERENCES pais_origem(id)
);
    
    CREATE TABLE usuario_bebida (
	id_bebida INTEGER,
    id_usuario INTEGER,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    PRIMARY KEY (id_bebida, id_usuario)
);

CREATE TABLE bebida_material (
	id_bebida INTEGER,
    id_material INTEGER,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_material) REFERENCES material(id),
    PRIMARY KEY (id_bebida, id_material)
);

CREATE TABLE bebida_harmonizacao (
	id_bebida INTEGER,
    id_harmonizacao INTEGER,
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
    FOREIGN KEY (id_harmonizacao) REFERENCES harmonizacao(id),
    PRIMARY KEY (id_bebida, id_harmonizacao)
);

CREATE TABLE bebida_disponivel (
	id_loja INTEGER,
    id_bebida INTEGER,
    FOREIGN KEY (id_loja) REFERENCES loja(id),
    FOREIGN KEY (id_bebida) REFERENCES bebida(id),
	PRIMARY KEY (id_loja, id_bebida),
	preco DOUBLE 
);