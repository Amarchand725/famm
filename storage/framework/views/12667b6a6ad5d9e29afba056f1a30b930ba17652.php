<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
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
        <link rel="stylesheet" type="text/css" href="<?php echo e(asset('/public/web/css/bootstrap.css')); ?>" />
        <!-- font awesome style -->
        <link href="<?php echo e(asset('/public/web/css/font-awesome.min.css')); ?>" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="<?php echo e(asset('/public/web/css/style.css')); ?>" rel="stylesheet" />
        <!-- responsive style -->
        <link href="<?php echo e(asset('/public/web/css/responsive.css')); ?>" rel="stylesheet" />

        <?php echo app('Illuminate\Foundation\Vite')('resources/css/app.css'); ?>
    </head>
    <body>
        <?php echo $__env->yieldContent('content'); ?>

        <?php echo app('Illuminate\Foundation\Vite')('resources/js/app.js'); ?>

        <!-- jQery -->
        <script src="<?php echo e(asset('/public/web/js/jquery-3.4.1.min.js')); ?>"></script>
        <!-- popper js -->
        <script src="<?php echo e(asset('/public/web/js/popper.min.js')); ?>"></script>
        <!-- bootstrap js -->
        <script src="<?php echo e(asset('/public/web/js/bootstrap.js')); ?>"></script>
        <!-- custom js -->
        <script src="<?php echo e(asset('/public/web/js/custom.js')); ?>"></script>
    </body>
</html>
<?php /**PATH C:\wamp64\www\famm\resources\views/layouts/web/app.blade.php ENDPATH**/ ?>