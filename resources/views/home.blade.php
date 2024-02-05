@include('navbar')
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Event Management System</title>
</head>

<body>
    <div class="main">
        <div class="banner">
            <div class="content">
                @auth
                    <h3>Welcome, <span>{{ Auth::user()->name }}</span> make your Tasks easy to manage.</h3>
                @else
                    <h3>Welcome, make your <span>Tasks</span> easy to manage.</h3>
                @endauth
            </div>
            <div class="cards">
                <div class="card card1">
                    <div class="cardLogo">
                        <img src="./images/services1.png" alt="">
                    </div>
                    <div class="cardContent">
                        <h2>Manage Tasks</h2>
                        <!-- <input type="file"> -->
                        <a href="{{route('tasks.create')}}"><button>Get Started</button></a>
                    </div>
                </div>

                <div class="card card2">
                    <div class="cardLogo">
                        <img style="width: 180px; height: 180px;" src="./images/aboutus1.png" alt="">
                    </div>
                    <div class="cardContent">
                        <h2>About us</h2>
                        <a href="{{'/about'}}"><button>view details</button></a>
                    </div>
                </div>

                @auth
                    <div class="card card3">
                        <div class="cardLogo">
                            <img style="width: 180px; height: 180px;" src="./images/contactus1.png" alt="">
                        </div>
                        <div class="cardContent">
                            <h2>Feedback</h2>
                            <a href="{{'/about'}}"><button>Give Feedback</button></a>
                        </div>
                    </div>
                @endauth
            </div>
        </div>
    </div>
</body>

</html>