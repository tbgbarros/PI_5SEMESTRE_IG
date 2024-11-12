/* Lógico_1: */

CREATE TABLE Login_User (
    id INTEGER PRIMARY KEY,
    senha VARCHAR,
    email VARCHAR,
    nome VARCHAR,
    data_nascimento DATE,
    logradouro VARCHAR,
    bairro VARCHAR,
    cidade VARCHAR,
    cep VARCHAR,
    numero_casa INTEGER,
    telefone VARCHAR,
    estado VARCHAR,
    admin BOOLEAN,
    login_id INTEGER,
    dependente_id INTEGER
);

CREATE TABLE Dependente (
    id INTEGER PRIMARY KEY,
    nome_dependete VARCHAR,
    fk_Login_User_id INTEGER
);

CREATE TABLE Post (
    id INTEGER PRIMARY KEY,
    midia_url VARCHAR,
    data DATE,
    hora TIME,
    descricao VARCHAR,
    user_id INTEGER,
    fk_Login_User_id INTEGER
);

CREATE TABLE Like (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER,
    quantidade_likes INTEGER,
    fk_Post_id INTEGER
);

CREATE TABLE Salvar (
    user_id INTEGER,
    id INTEGER PRIMARY KEY,
    post_id INTEGER,
    fk_Post_id INTEGER
);
 
ALTER TABLE Dependente ADD CONSTRAINT FK_Dependente_2
    FOREIGN KEY (fk_Login_User_id)
    REFERENCES Login_User (id)
    ON DELETE CASCADE;
 
ALTER TABLE Post ADD CONSTRAINT FK_Post_2
    FOREIGN KEY (fk_Login_User_id)
    REFERENCES Login_User (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Like ADD CONSTRAINT FK_Like_2
    FOREIGN KEY (fk_Post_id)
    REFERENCES Post (id)
    ON DELETE CASCADE;
 
ALTER TABLE Salvar ADD CONSTRAINT FK_Salvar_2
    FOREIGN KEY (fk_Post_id)
    REFERENCES Post (id)
    ON DELETE CASCADE;