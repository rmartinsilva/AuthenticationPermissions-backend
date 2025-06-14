<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Grupo;

class GrupoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Grupo::updateOrCreate(
            ['descricao' => 'admin'],
            ['descricao' => 'admin'] // Apenas para garantir que exista
        );
    }
}
