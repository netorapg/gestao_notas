const criarTabelas = [
  '''
  CREATE TABLE professor (
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    descricao VARCHAR(200),
    cpf CHAR(14) NOT NULL UNIQUE,
    status CHAR(1) NOT NULL
  )
  '''
];

const inserirRegistros = [
  '''
  INSERT INTO professor (id, nome, descricao, cpf, status) VALUES (1, 'João', 'Professor de Matemática','123.456.789-00', 'A')
  ''',
  '''
  INSERT INTO professor (id, nome, descricao, cpf, status) VALUES (2, 'Maria', 'Professora de Português', '987.654.321-00', 'A')
  ''',
  '''
  INSERT INTO professor (id, nome, descricao, cpf, status) VALUES (3, 'José', 'Professor de História', '456.789.123-00', 'A')
  '''
];