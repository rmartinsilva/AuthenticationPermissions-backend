<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\Cache; // Opcional: Para cachear permissões

class Usuario extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'usuarios';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'login',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array<string, mixed>
     */
    public function getJWTCustomClaims(): array
    {
        // Garante que as relações necessárias estão carregadas
        if (!$this->relationLoaded('grupos') || !$this->grupos->first()?->relationLoaded('acessos')) {
            $this->load('grupos.acessos');
        }

        $permissions = collect();
        foreach ($this->grupos as $grupo) {
            $permissions = $permissions->merge($grupo->acessos->pluck('key'));
        }

        // Retorna as permissões únicas como uma claim chamada 'permissions'
        return [
            'id' => $this->id,
            'name' => $this->name,
            'login' => $this->login,
            'permissions' => $permissions->unique()->values()->all()
        ];
    }

    /**
     * Os grupos aos quais o usuário pertence.
     */
    public function grupos(): BelongsToMany
    {
        return $this->belongsToMany(Grupo::class, 'grupo_usuario');
    }

    /**
     * Verifica se o usuário possui uma determinada permissão através de seus grupos.
     *
     * @param string $permissionKey A chave (key) da permissão a ser verificada.
     * @return bool
     */
    public function hasPermissionTo(string $permissionKey): bool
    {
        // Garante que as relações necessárias estão carregadas
        // Se a relação 'grupos' já foi carregada, verifica se os 'acessos' dela também foram
        if (!$this->relationLoaded('grupos') || !$this->grupos->first()?->relationLoaded('acessos')) {
            $this->load('grupos.acessos');
        }

        // Agora itera sobre os grupos (que garantidamente têm seus acessos carregados)
        foreach ($this->grupos as $grupo) {
            if ($grupo->acessos->contains('key', $permissionKey)) {
                return true;
            }
        }

        return false;
    }

    // Opcional: Método para limpar cache de permissões ao atualizar grupos/acessos
    // public static function boot()
    // {
    //     parent::boot();
    //     static::saved(function ($model) {
    //         Cache::forget("user_{$model->id}_permissions");
    //     });
    //     // Adicionar listeners para Grupo e Acesso também, se usar cache
    // }
}
