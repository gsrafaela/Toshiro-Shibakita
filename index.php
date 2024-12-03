<html>
<head>
    <title>Exemplo PHP</title>
</head>
<body>

<?php
ini_set("display_errors", 1);
error_reporting(E_ALL); // Reportar todos os erros
header('Content-Type: text/html; charset=utf-8'); // Usando UTF-8 para melhor compatibilidade

// Exibir versão do PHP
echo 'Versão Atual do PHP: ' . phpversion() . '<br>';

$servername = "54.234.153.24";
$username = "root";
$password = "Senha123";
$database = "meubanco";

// Criar conexão com o banco de dados
$link = new mysqli($servername, $username, $password, $database);

// Verificar a conexão
if ($link->connect_error) {
    die("Erro de conexão: " . $link->connect_error);
}

// Gerar valores aleatórios
$valor_rand1 = rand(1, 999);
$valor_rand2 = strtoupper(substr(bin2hex(random_bytes(4)), 1));
$host_name = gethostname();

// Preparar a consulta SQL de forma segura utilizando prepared statements
$query = $link->prepare("INSERT INTO dados (AlunoID, Nome, Sobrenome, Endereco, Cidade, Host) 
                         VALUES (?, ?, ?, ?, ?, ?)");

// Verificar se a preparação da consulta foi bem-sucedida
if ($query === false) {
    die("Erro ao preparar a consulta: " . $link->error);
}

// Vincular os parâmetros para a consulta (tipo: i - inteiro, s - string)
$query->bind_param("isssss", $valor_rand1, $valor_rand2, $valor_rand2, $valor_rand2, $valor_rand2, $host_name);

// Executar a consulta
if ($query->execute()) {
    echo "Novo registro criado com sucesso";
} else {
    echo "Erro: " . $query->error;
}

// Fechar a conexão
$query->close();
$link->close();
?>

</body>
</html>
