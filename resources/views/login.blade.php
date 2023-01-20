@extends('layouts.admin.auth.app')

@section('content')
    <div class="hold-transition login-page" style="margin-top:-60px">
        <div class="login-box">
            <div class="login-logo">
                <a href="{{ url('admin/dashboard') }}"><b>Admin</b>LTE</a>
            </div>

            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start your session</p>
                    <input type="hidden" id="admin-dashboard-route" value="{{ url('admin/dashboard') }}">
                    <form id="sign_in_form" data-action="{{ url('admin/login') }}">
                        @csrf

                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Email" required name="email" id="email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" required name="password" id="password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <span class="text-danger" id="error-email">{{ $errors->first('email') }}</span>
                        <span class="text-danger" id="error-password">{{ $errors->first('password') }}</span>
                        @if(Session::has('error'))
                            <span class="text-danger">{{ Session::get('error') }}</span>
                        @endif
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                    Remember Me
                                    </label>
                                </div>
                            </div>

                            <div class="col-4">
                                {{-- <button type="submit" id="sign_in_submit" class="btn btn-primary btn-block">Sign In</button> --}}
                                <button type="submit" id="sign_in_submit" class="btn btn-primary btn-block">
                                    <!--begin::Indicator-->
                                    <span class="indicator-label">
                                        Sing In
                                    </span>
                                    <span class="indicator-progress d-none">
                                        Please wait...
                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="social-auth-links text-center mb-3">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-block btn-primary">
                            <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
                        </a>
                        <a href="#" class="btn btn-block btn-danger">
                            <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
                        </a>
                    </div>

                    <p class="mb-1">
                        <a href="forgot-password.html">I forgot my password</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
        $('#sign_in_submit').on('click', function(e){
            e.preventDefault();
            var redirect_to = $('#admin-dashboard-route').val();
            var url = $('#sign_in_form').attr('data-action');
            var email = $('#email').val();
            var password = $('#password').val();

            $('.indicator-label').hide();
            $('.indicator-progress').show();

            $.ajax({
                type:'POST',
                url:url,
                data:{_token: "{{ csrf_token() }}", email:email, password:password},
                success: function(response) {
                    $('.indicator-label').show();
                    $('.indicator-progress').hide();
                    if(response.status=='success'){
                        Swal.fire({
                            title: "Login Successfully!",
                            text: "You have successfully logged in!",
                            type: "success",
                            icon: 'success',
                            confirmButtonColor: '#3085d6',
                        }).then(okay => {
                            if (okay) {
                                window.location.href = redirect_to;
                            }
                        });
                    }else if(response.status=='failed'){
                        Swal.fire(
                            'Oops...',
                            'Failed to login try again.!',
                            'error'
                        )
                    }else if(response.status=='failed-inactive'){
                        Swal.fire(
                            'Oops...',
                            'Your account is not active verify your email we have sent you verification link.!',
                            'error'
                        )
                    }else if(response.status=='failed-credential'){
                        Swal.fire(
                            'Oops...',
                            'Credentials not matched try again!',
                            'error'
                        )
                    }
                },
                error: function (request, status, error) {
                    $('.indicator-label').show();
                    $('.indicator-progress').hide();
                    if(request.responseJSON.errors.email || request.responseJSON.errors.password){
                        $('#error-email').html('Email & Password are required');
                    }else{
                        $('#error-email').html('');
                    }
                }
            });
        });
    </script>
@endpush
