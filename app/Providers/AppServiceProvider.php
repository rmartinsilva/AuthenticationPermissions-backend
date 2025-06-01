<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

// Repositories
use App\Repositories\Contracts\{
    UsuarioRepositoryInterface,
    GrupoRepositoryInterface,
    AcessoRepositoryInterface,
    GrupoUsuarioRepositoryInterface,
    AcessoGrupoRepositoryInterface
};
use App\Repositories\Eloquent\{
    UsuarioRepository,
    GrupoRepository,
    AcessoRepository,
    GrupoUsuarioRepository,
    AcessoGrupoRepository
};

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(
            UsuarioRepositoryInterface::class,
            UsuarioRepository::class
        );

        $this->app->bind(
            GrupoRepositoryInterface::class,
            GrupoRepository::class
        );

        $this->app->bind(
            AcessoRepositoryInterface::class,
            AcessoRepository::class
        );

        $this->app->bind(
            GrupoUsuarioRepositoryInterface::class,
            GrupoUsuarioRepository::class
        );

        $this->app->bind(
            AcessoGrupoRepositoryInterface::class,
            AcessoGrupoRepository::class
        );
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
