<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">
        <title>Famms - Fashion HTML Template</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="public/web/css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="public/web/css/font-awesome.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="public/web/css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="public/web/css/responsive.css" rel="stylesheet" />

        @vite('resources/css/app.css')
    </head>
    <body>
        @yield('content')

        @vite('resources/js/app.js')

        <!-- jQery -->
        <script src="public/web/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="public/web/js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="public/web/js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="public/web/js/custom.js"></script>
    </body>
</html>
