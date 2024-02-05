<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::create([
            'name' => 'Test User',
            'email' => 'xyz@gmail.com',
            'password' => bcrypt('xyz12345'),
        ]);

        \App\Models\Role::create([
            'name' => 'admin',
        ]);

        \App\Models\Role::create([
            'name' => 'user',
        ]);

        \App\Models\Permission::create([
            'name' => 'create_task',
        ]);

        \App\Models\Permission::create([
            'name' => 'update_task',
        ]);
    }
}
