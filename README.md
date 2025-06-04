Projeto Php 8.2 e Laravel 12 Para um Sistema com Gerenciamento de Permissões por Grupo de Usuários.

O foco é ter grupos de usuários com permissões diferentes dentro de um sistema de forma dinâmica, ficando fácil a personalização dentro do próprio cliente sem a necessidade de nenhuma alteração no código e deploy.

Instruções para Utilizar o Sistema

Gerar token Jwt
php artisan jwt:secret

Gerar key Laravel
php artisan key:generate

Atualize o .env com seus dados de conexão

//Cria o Bando de Dados

 php artisan migrate

//Cria os registros iniciais do banco de dados

 php artisan db:seed

 senha do administrador
 login: admin
 senha: 102030

Url para o Front-end em Angular 19
https://github.com/rmartinsilva/AuthenticationPermissions-frontend
