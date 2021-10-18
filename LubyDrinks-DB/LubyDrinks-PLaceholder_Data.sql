USE lubydrinks;

INSERT INTO pais_origem (id, nome) 
VALUES 
(1, "França"), 
(2, "Portugal"), 
(3, "Argentina");

INSERT INTO produtor (id, nome) 
VALUES 
(1, "José Chique"), 
(2, "Maria Luxo"), 
(3, "Pedro Cachaça");

INSERT INTO material (id, nome) 
VALUES 
(1, "Cabernet Franc"), 
(2, "Malte"), 
(3, "Trigo");

INSERT INTO tipo_bebida (id, nome) 
VALUES 
(1, "IPA"), 
(2, "Tinto"), 
(3, "Bordot");

INSERT INTO tipo_harmonizacao (id, nome) 
VALUES 
(1, "Carnes"), 
(2, "Queijos"), 
(3, "Petiscos");

INSERT INTO tipo_loja (id, nome) 
VALUES 
(1, "Comidas"),
(2, "Bebidas"),
(3, "Comidads e Bebidas");

INSERT INTO loja (id, nome, avaliacao, id_tipo_loja) 
VALUES 
(1, "Loja 1", 4.3, 2),
(2, "Loja 2", 5.0, 2),
(3, "Loja 3", 3.2, 3);

INSERT INTO harmonizacao (id, nome, id_tipo_harmonizacao)
VALUES
(1, "Queijo Minas", 2),
(2, "Salaminho", 3),
(3, "Picanha", 1);

INSERT INTO usuario (id, nome, email, telefone, senha)
VALUES
(1, "João", "joao@gmail.com", "(62) 4002-8922", "hash super seguro"),
(2, "Guilherme", "guilherme@gmail.com", "(62) 4002-8922", "hash super seguro"),
(3, "Lucas", "guilherme@gmail.com", "(62) 4002-8922", "hash super seguro");

INSERT INTO bebida (id, nome, teor, tempo_envazamento, litragem, temperatura_servico, id_produtor, id_pais_origem, id_tipo_bebida) 
VALUES 
(1, "Vinho 1", 10.5, "2020/05/11", 500, "15 a 18°C", 1, 2, 2), 
(2, "Cerveja 1", 15.5, "2020/06/12", 1000, "0 a 5°C", 2, 2, 1), 
(3, "Vinho 2", 10.5, "2003/04/21", 500, "18 a 20°C", 3, 2, 3);

INSERT INTO bebida_material (id_bebida, id_material) 
VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO bebida_disponivel (id_loja, id_bebida, preco) 
VALUES 
(1, 1, 200.00),
(1, 3, 150.00),
(3, 2, 35.50);

INSERT INTO bebida_harmonizacao (id_bebida, id_harmonizacao) 
VALUES 
(1, 3),
(2, 2),
(3, 1);

INSERT INTO usuario_bebida (id_usuario, id_bebida) 
VALUES 
(1, 3),
(2, 2),
(3, 1);
