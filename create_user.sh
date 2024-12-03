#!/bin/bash

# Função para criar um usuário
criar_usuario() {
    local usuario=$1
    local senha=$2
    echo "Criando usuário $usuario..."
    
    # Cria o usuário com os parâmetros fornecidos
    useradd "$usuario" -c "Usuário convidado" -s /bin/bash -m -p "$(openssl passwd -crypt "$senha")"
    
    # Expira a senha para forçar a troca na primeira entrada
    passwd "$usuario" -e
}

# Senha padrão para os usuários
senha="Senha123"

# Lista de usuários
usuarios=("guest10" "guest11" "guest12" "guest13")

echo "Criando usuários do sistema..."

# Loop para criar os usuários
for usuario in "${usuarios[@]}"; do
    criar_usuario "$usuario" "$senha"
done

echo "Finalizado!!"
