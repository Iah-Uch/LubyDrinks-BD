# **LubyDrinks-BD**
Banco de Dados do projeto de treino <a href="https://phpa35.medium.com/lubydrinks-8da08ee58432">LubyDrinks</a> .

<ul>
  <li>
    <h2><a href="https://github.com/Iah-Uch/LubyDrinks-BD/blob/main/LubyDrinks-DB/LubyDrinks-Schema.mwb">Modelo Lógico</a></h2>
    <img src="https://user-images.githubusercontent.com/84246094/137789773-fa952c98-d2c3-4554-b7eb-f039f87a0b10.png" title="Modelo Lógico" width="800" height="790"/>
  </li>
  <li>
    <h2><a href="https://github.com/Iah-Uch/LubyDrinks-BD/blob/main/LubyDrinks-DB/LubyDrinks-Structure.sql">Modelo Físico</a></h2>
    
```mysql
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
```
    
  </li>
  <li>
    <h2><a href="https://codepen.io/iah-uch/pen/JjyXzxM">Dicionário de Dados</a></h2>
    
  </li>
</ul>

### **Contribuintes:**

- <a href="https://github.com/Iah-Uch">Iãh Uchôa</a>
- <a href="https://github.com/JP-Barbaresco">João Pedro Barbaresco</a>
- <a href="https://github.com/LucasEvanglg">Lucas Evangelista</a>


### **Tecnologias utilizadas:**
<a href="#" target="_blank" title="MySQL"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original.svg" alt="MySQL" width="60" height="60"/> </a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/Iah-Uch/WB-DataDict-Mod" target="_blank" title="DataDict"> <img align="top" src="https://user-images.githubusercontent.com/84246094/137782477-98f85310-20d3-4482-9927-a75c2af889f8.png" alt="DataDict" width="130" height="35" /> </a>


