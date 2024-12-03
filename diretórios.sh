#!/bin/bash

# Função para criar diretórios
criar_diretorios() {
    echo "Criando diretórios..."
    mkdir -p /publico /adm /ven /sec
}

# Função para criar grupos de usuários
criar_grupos() {
    echo "Criando grupos de usuários..."
    groupadd GRP_ADM
    groupadd GRP_VEN
    groupadd GRP_SEC
}

# Função para criar usuários
criar_usuarios() {
    echo "Criando usuários..."

    # Definir senha padrão
    senha="Senha123"

    # Grupo GRP_ADM
    useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_ADM
    useradd maria -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_ADM
    useradd joao -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_ADM

    # Grupo GRP_VEN
    useradd debora -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_VEN
    useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_VEN
    useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_VEN

    # Grupo GRP_SEC
    useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_SEC
    useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_SEC
    useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt "$senha") -G GRP_SEC
}

# Função para configurar permissões
configurar_permissoes() {
    echo "Especificando permissões dos diretórios..."
    
    chown root:GRP_ADM /adm
    chown root:GRP_VEN /ven
    chown root:GRP_SEC /sec

    chmod 770 /adm
    chmod 770 /ven
    chmod 770 /sec
    chmod 777 /publico
}

# Função principal
main() {
    criar_diretorios
    criar_grupos
    criar_usuarios
    configurar_permissoes
    echo "Fim....."
}

# Executar o script
main
