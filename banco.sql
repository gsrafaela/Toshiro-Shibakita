CREATE TABLE dados (
    AlunoID int PRIMARY KEY,               
    Nome varchar(100) NOT NULL,            
    Sobrenome varchar(100) NOT NULL,       
    Endereco text NOT NULL,              
    Cidade varchar(50) DEFAULT 'Desconhecida', 
    Host varchar(50) UNIQUE DEFAULT 'localhost' 
);
