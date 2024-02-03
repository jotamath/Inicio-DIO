USE Oficina;

SELECT * FROM PF;
INSERT INTO PF VALUES 			(1, 'João', 12345678910, 'Rua Chaves, 08', '9999999999'),
								(2, 'Mariana', 12378965410, 'Rua Rapaaz, 50', '11998551616'),
                                (3, 'Thiago', 01987654321, 'Rua Mamãe Querida, 71', '159984646512');
SELECT * FROM Veiculos;
INSERT INTO Veiculos VALUES 	(1, 1, 'KJP-1448'),
								(2, 2, 'NEN-5942'),
								(3, 3, 'HPC-9133');
SELECT * FROM Conserto;
INSERT INTO Conserto VALUES (1, 'Não funciona'),
							(2, 'Quebrado'),
                            (3, 'Não liga');
SELECT * FROM Mecanico;
INSERT INTO Mecanico VALUES	(1, 'Fulano', 'Rua dos Malucos, 69', 'Eletricista'),
							(2, 'Ciclano', 'Rua sem nome, S/N', 'Eletricista'),
                            (3, 'Belt', 'Rua sem Galera, 21', 'Reparos Gerais'),
                            (4, 'Beltrano do Povo', 'Rua da Galera, 265', 'Funilaria'),
                            (5, 'Boca', 'Rua Jamais, 44', 'Borracheiro'),
                            (6, 'Cocão', 'Av. Arvores, 75', 'Especialista em Motor');

SELECT * FROM OdServiço;
INSERT INTO OdServiço VALUES 	(1, '2024/02/03', '134.50', '15.00', '149.50', 'NÃO REALIZADO', NULL),
								(2, '2024/02/01', '198.90', '80.90', '207.88', 'CONCLUIDO', '2024/02/03'),
								(3, '2024/02/01', '930.99', '520.10', '930.99', 'CONCLUIDO', '2024/02/03'),
								(4, '2024/02/03', '245.70', '110.90', '356.60', 'EM ANDAMENTO', NULL),
								(5, '2024/02/03', '480.87', '10.15', '491.02', 'CANCELADO', NULL),
								(6, '2024/02/03', '736.56', '7.50', '736.56', 'EM ANDAMENTO', NULL);
                                
SELECT * FROM Autorização;
INSERT INTO Autorização VALUES 	(1, FALSE),
								(2, TRUE),
								(3, TRUE),
								(4, TRUE),
								(5, FALSE),
								(6, TRUE);
                                
SELECT * FROM Pecas;
INSERT INTO Pecas VALUES 	(1, 'Volante', '15.00'),
							(2, 'Pistão', '80.90'),
							(3, 'Cambio', '520.10'),
							(4, 'Caixa eletrica', '110.90'),
							(5, 'Pneu', '10.15'),
							(6, 'Ar Condicionado', '7.50');
                                
SELECT * FROM Serviços;
INSERT INTO Serviços VALUES 	(1, 'Problemas Eletricos', '134.50'),
								(2, 'Caixa de cambio quebrado', '198.90'),
								(3, 'Problemas Eletricos', '930.99'),
								(4, 'Peça proxima a caixa de direção danificada', '245.70'),
								(5, 'Pneu Furado', '480.87'),
								(6, 'O sistema de ar condicionado danificada', '736.56');

SELECT Autorização.Autorizado, OdServiço.idOS, Clientes.idClientes
FROM Autorização
	CROSS JOIN OdServiço, Clientes;