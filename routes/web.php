<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\HomeController;
use App\Mail\NotificationMails; 
use Illuminate\Support\Facades\Mail; 

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Public Routes
Route::get('/', function () {
    return view('home');
})->name('home');

Route::get('/about', function () {
    return view('about');
})->name('about');



Auth::routes();
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', [HomeController::class, 'index'])->name('dashboard');
    
    Route::prefix('tasks')->group(function () {
        Route::get('/create', [TaskController::class, 'show'])->name('tasks.create');
        Route::post('/store', [TaskController::class, 'store'])->name('tasks.store');
        Route::get('/', function () {
            return view('tasks');
        })->name('tasks.index');
        
        Route::delete('/delete/{id}', [TaskController::class, 'destroy'])->name('tasks.destroy');
        Route::patch('/update/{id}', [TaskController::class, 'update'])->name('tasks.update');
    });
});