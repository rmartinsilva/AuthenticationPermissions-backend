<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Painel\AuthController;
use App\Http\Controllers\Api\Painel\UsuarioController;
use App\Http\Controllers\Api\Painel\GrupoController;
use App\Http\Controllers\Api\Painel\AcessoController;
use App\Http\Controllers\Api\Painel\GrupoUsuarioController;
use App\Http\Controllers\Api\Painel\AcessoGrupoController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::prefix('painel')->group(function () {
    Route::prefix('auth')->group(function () {
        Route::post('login', [AuthController::class, 'login']);
        Route::middleware('jwt.auth')->group(function () {
            Route::post('logout', [AuthController::class, 'logout']);
            Route::post('refresh', [AuthController::class, 'refresh']);
            Route::post('me', [AuthController::class, 'me']);
        });
    });

    Route::middleware('jwt.auth')->group(function () {
        // IMPORTANTE: Rotas com caminhos fixos devem vir ANTES das rotas com parâmetros dinâmicos
        // para evitar que o Laravel interprete o caminho fixo como um parâmetro dinâmico
        Route::get('usuarios/check-login', [UsuarioController::class, 'checkLogin'])->middleware('can:create_usuarios');

        // Rotas com parâmetros dinâmicos
        Route::get('usuarios', [UsuarioController::class, 'index'])->middleware('can:view_usuarios');
        Route::post('usuarios', [UsuarioController::class, 'store'])->middleware('can:create_usuarios');
        Route::get('usuarios/{usuario}', [UsuarioController::class, 'show'])->middleware('can:view_usuarios');
        Route::put('usuarios/{usuario}', [UsuarioController::class, 'update'])->middleware('can:update_usuarios');
        //Route::patch('usuarios/{usuario}', [UsuarioController::class, 'update'])->middleware('can:update_usuarios');
        Route::delete('usuarios/{usuario}', [UsuarioController::class, 'destroy'])->middleware('can:delete_usuarios');

        Route::get('grupos', [GrupoController::class, 'index'])->middleware('can:view_grupos');
        Route::post('grupos', [GrupoController::class, 'store'])->middleware('can:create_grupos');
        Route::get('grupos/all', [GrupoController::class, 'getAll'])->name('grupos.getAll')->middleware('can:view_grupos');
        Route::get('grupos/{grupo}', [GrupoController::class, 'show'])->middleware('can:view_grupos');
        Route::put('grupos/{grupo}', [GrupoController::class, 'update'])->middleware('can:update_grupos');
        //Route::patch('grupos/{grupo}', [GrupoController::class, 'update'])->middleware('can:update_grupos');
        Route::delete('grupos/{grupo}', [GrupoController::class, 'destroy'])->middleware('can:delete_grupos');
        Route::post('grupos/{grupo}/sync-acessos', [GrupoController::class, 'syncAcessos'])->name('grupos.syncAcessos')->middleware('can:manage_grupo_acessos');
        Route::post('grupos/{grupo}/sync-usuarios', [GrupoController::class, 'syncUsuarios'])->name('grupos.syncUsuarios')->middleware('can:manage_grupo_usuarios');

        

        Route::get('acessos', [AcessoController::class, 'index'])->middleware('can:view_acessos');
        Route::get('acessos/all', [AcessoController::class, 'getAll'])->name('acessos.getAll')->middleware('can:view_acessos');
        Route::post('acessos', [AcessoController::class, 'store'])->middleware('can:create_acessos');
        Route::get('acessos/{acesso}', [AcessoController::class, 'show'])->middleware('can:view_acessos');
        
        Route::put('acessos/{acesso}', [AcessoController::class, 'update'])->middleware('can:update_acessos');

        //Route::patch('acessos/{acesso}', [AcessoController::class, 'update'])->middleware('can:update_acessos');
        Route::delete('acessos/{acesso}', [AcessoController::class, 'destroy'])->middleware('can:delete_acessos');

        // Rotas para gerenciamento de grupo_usuario
        Route::get('grupo-usuario', [GrupoUsuarioController::class, 'index'])->middleware('can:view_grupo_usuario');
        Route::post('grupo-usuario', [GrupoUsuarioController::class, 'store'])->middleware('can:create_grupo_usuario');
        Route::get('grupo-usuario/all', [GrupoUsuarioController::class, 'getAll'])->name('grupo-usuario.getAll')->middleware('can:view_grupo_usuario');
        Route::get('grupo-usuario/grupos-disponiveis/{usuario_id}', [GrupoUsuarioController::class, 'getGruposDisponiveis'])->name('grupo-usuario.grupos-disponiveis')->middleware('can:view_grupo_usuario');
        Route::get('grupo-usuario/{grupoUsuario}', [GrupoUsuarioController::class, 'show'])->middleware('can:view_grupo_usuario');
        Route::put('grupo-usuario/{grupoUsuario}', [GrupoUsuarioController::class, 'update'])->middleware('can:update_grupo_usuario');
        //Route::patch('grupo-usuario/{grupoUsuario}', [GrupoUsuarioController::class, 'update'])->middleware('can:update_grupo_usuario');
        Route::delete('grupo-usuario/{grupoUsuario}', [GrupoUsuarioController::class, 'destroy'])->middleware('can:delete_grupo_usuario');
        
        // Rotas para gerenciamento de acesso_grupo
        Route::get('acesso-grupo', [AcessoGrupoController::class, 'index'])->middleware('can:view_acesso_grupo');
        Route::get('acesso-grupo/all', [AcessoGrupoController::class, 'getAll'])->name('acesso-grupo.getAll')->middleware('can:view_acesso_grupo');
        Route::get('acesso-grupo/acessos-disponiveis/{grupo_id}', [AcessoGrupoController::class, 'getAcessosDisponiveisParaGrupo'])->name('acesso-grupo.acessosDisponiveis')->middleware('can:view_acesso_grupo');
        Route::get('acesso-grupo/acessos-bygrupo/{grupo_id}', [AcessoGrupoController::class, 'findByGrupo'])->name('acesso-grupo.acessosDisponiveis')->middleware('can:view_acesso_grupo');
        Route::post('acesso-grupo/{grupo_id}/sync', [AcessoGrupoController::class, 'syncAcessosGrupo'])->name('painel.acesso-grupo.sync');
        Route::post('acesso-grupo', [AcessoGrupoController::class, 'store'])->middleware('can:create_acesso_grupo');
        Route::get('acesso-grupo/{acessoGrupo}', [AcessoGrupoController::class, 'show'])->middleware('can:view_acesso_grupo');
        Route::put('acesso-grupo/{acessoGrupo}', [AcessoGrupoController::class, 'update'])->middleware('can:update_acesso_grupo');
        
//        Route::patch('acesso-grupo/{acessoGrupo}', [AcessoGrupoController::class, 'update'])->middleware('can:update_acesso_grupo');
        Route::delete('acesso-grupo/{acessoGrupo}', [AcessoGrupoController::class, 'destroy'])->middleware('can:delete_acesso_grupo');

        

    });
});
