<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="{{ asset('favicon.png') }}" type="image/png" />
    <title>Skill Syntax - Register</title>
    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- Fontawesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
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
            background-color: rgba(0, 0, 0, 0.6) !important;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 20px;
        }
        .card-header h3 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 500;
        }
        .input-group-prepend span {
            background-color: #FFC312;
            color: black;
            border: 0;
            border-radius: 5px 0 0 5px;
        }
        .input-group input {
            border-radius: 0 5px 5px 0;
            border: 1px solid #FFC312;
        }
        .input-group input:focus {
            box-shadow: none;
            border-color: #FFC312;
        }
        .login_btn {
            color: black;
            background-color: #FFC312;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        .login_btn:hover {
            color: #FFC312;
            background-color: white;
            border: 1px solid #FFC312;
        }
        .links {
            color: white;
            text-align: center;
        }
        .links a {
            color: #FFC312;
            font-weight: 500;
            text-decoration: none;
            margin-left: 5px;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Register</h3>
            </div>
            <div class="card-body">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <form method="POST" action="{{ route('register.store') }}">
                    @csrf
                    <input type="hidden" name="url" value="{{$url}}">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" name="name" placeholder="Name" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        </div>
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Register" class="btn login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Already have an account? <a href="{{ route('login') }}">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
