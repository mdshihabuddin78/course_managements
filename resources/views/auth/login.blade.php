<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="{{ asset('favicon.png') }}" type="image/png" />
    <title>Skill Syntax - Login</title>

    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Fontawesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- Custom styles -->
    <style>
        @import url('https://fonts.googleapis.com/css?family=Numans');

        html, body {
            background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;
            font-family: 'Numans', sans-serif;
        }

        .container {
            height: 100%;
            align-content: center;
        }

        .card {
            height: auto;
            margin-top: auto;
            margin-bottom: auto;
            width: 400px;
            background-color: rgba(0, 0, 0, 0.5) !important;
            padding: 20px;
        }

        .social_icon span {
            font-size: 60px;
            margin-left: 10px;
            color: #FFC312;
        }

        .social_icon span:hover {
            color: white;
            cursor: pointer;
        }

        .card-header h3 {
            color: white;
            margin-bottom: 20px;
        }

        .social_icon {
            position: absolute;
            right: 20px;
            top: -45px;
        }

        .input-group-prepend span {
            width: 50px;
            background-color: #FFC312;
            color: black;
            border: 0 !important;
        }

        input:focus {
            outline: 0 0 0 0 !important;
            box-shadow: 0 0 0 0 !important;
        }

        .remember {
            color: white;
        }

        .remember input {
            width: 20px;
            height: 20px;
            margin-left: 15px;
            margin-right: 5px;
        }

        .login_btn {
            color: black;
            background-color: #FFC312;
            border: none;
            width: 100%;
            padding: 10px;
            font-weight: bold;
        }

        .login_btn:hover {
            color: #FFC312;
            background-color: white;
            border: 2px solid #FFC312;
        }

        .signup_btn {
            color: black;
            background-color: #FFC312;
            border: none;
            width: 100%;
            padding: 10px;
            font-weight: bold;
            margin-top: 10px;
        }

        .signup_btn:hover {
            color: #FFC312;
            background-color: white;
            border: 2px solid #FFC312;
        }

        .forgot-password {
            color: #FFC312;
            font-size: 0.9rem;
        }

        .forgot-password:hover {
            color: white;
            text-decoration: underline;
        }

        .btn-wrapper {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Sign In</h3>
                <div class="d-flex justify-content-end social_icon">
                    <span><i class="fab fa-facebook-square"></i></span>
                    <span><i class="fab fa-google-plus-square"></i></span>
                    <span><i class="fab fa-github-square"></i></span>
                </div>
            </div>
            <div class="card-body">
                <form action="{{ route('login') }}" method="POST">
                    @csrf
                    <input type="hidden" name="url" value="{{$url}}">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                    <div class="row align-items-center remember">
                        <input type="checkbox" name="remember"> Remember Me
                    </div>
                    <div class="form-group btn-wrapper">
                        <button type="submit" class="btn login_btn">
                            <i class="fas fa-sign-in-alt"></i> Sign in
                        </button>
                        <a href="{{ route('register', ['url' => $url])}}" class="btn signup_btn">
                            <i class="fas fa-user-plus"></i> Sign Up New Account
                        </a>
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center">
                    <a href="#" class="forgot-password">Forgot your password?</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
