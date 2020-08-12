<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'LaraGram') }}</title>
    <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/util.css') }}" rel="stylesheet">


</head>
<body>
    <div class="app">
        <div class="limiter">
            <div class="row justify-content-center container-login100" style="background-image: url({{ asset('img/bg-01.jpg') }})">
                <div class="wrap-login100">
                    <div class="login100-pic">
                        <img src="img/icon-instagram.png" alt="IMG">
                    </div>

                    <form class="login100-form validate-form" method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
                        @csrf

                        <span class="login100-form-title">
                            Iniciar sesion <br>
                            LaraGram
                        </span>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Ingresa un correo válido, ejemplo: ex@abc.xyz">
                            <input class="input100 form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"  
                                    type="email" 
                                    name="email" 
                                    {{-- placeholder="Correo Electronico" --}}
                                    {{-- value="{{ old('email') }}"  --}}
                                    value="admin@admin.com">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>

                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ "El usuario o la contraseña no concuerdan" }}</strong>
                                </span>
                            @endif
                        </div>
    
                        <div class="form-group wrap-input100 validate-input" data-validate = "La contraseña es requerida">
                            <input class="input100 form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                    type="password" 
                                    name="password" 
                                    placeholder="Contraseña"
                                    value="123456">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>

                            @if ($errors->has('password'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ "Error de Contraseña" }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Ingresar
                            </button>
                        </div>
                        <div class="text-center p-t-12">
                            <a class="txt2" href="#">
                                Olvidaste tu contraseña?
                            </a>
                        </div>
    
                        <div class="text-center p-t-12">
                            <a class="txt2" href="{{ route('register')}}">
                                Crea tu cuenta
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>        
    </div>
<!--===============================================================================================-->	
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
    <script src="js/main.js"></script>
    <script src="js/main2.js"></script>

</body>
</html>

