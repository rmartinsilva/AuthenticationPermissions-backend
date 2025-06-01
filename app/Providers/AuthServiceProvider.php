<?php

namespace App\Providers;

// use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\Usuario;
use App\Models\Acesso;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        //
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

        // Tenta buscar os acessos do banco de dados para definir os Gates dinamicamente
        try {
            // Carrega todas as chaves de acesso uma vez
            $acessos = \App\Models\Acesso::pluck('key')->toArray();

            if (empty($acessos)) {
                // Remover log daqui
            }

            foreach ($acessos as $key) {
                // Define o Gate para cada chave encontrada
                \Illuminate\Support\Facades\Gate::define($key, function (\App\Models\Usuario $usuario) use ($key) {
                    return $usuario->hasPermissionTo($key);
                });
            }

        } catch (\Throwable $e) { // Usar Throwable para pegar mais tipos de erros
            // Você pode decidir relançar a exceção ou lidar com ela de outra forma
            // throw $e; // Exemplo: Relançar a exceção se desejar que a falha seja visível
        }

        // Gate para Super Admin (exemplo)
        // \Illuminate\Support\Facades\Gate::before(function (\App\Models\Usuario $usuario, $ability) {
        //     if ($usuario->isSuperAdmin()) { // Supondo um método isSuperAdmin()
        //         return true;
        //     }
        // });
    }
}
