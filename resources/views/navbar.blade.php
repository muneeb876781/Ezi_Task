<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Your Task Management App</title>
    <style>
        .text-uppercase {
            text-transform: uppercase !important;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="navbar">
        <div class="logo">
            <h1>Ezi<span>TASK</span></h1>
        </div>
        <div class="menus">
            <ul>
                @auth
                    <span class="username text-uppercase">{{ Auth::user()->name }}</span>
                    <li>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit">Logout</button>
                        </form>
                    </li>
                @else
                    <li><a class="login" href="{{ route('login') }}">Login</a></li>
                    <li><a class="register" href="{{ route('register') }}">Register</a></li>
                @endauth
            </ul>
        </div>
    </div>
</body>

</html>
