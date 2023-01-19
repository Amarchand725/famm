<script setup>
    import { reactive, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let form = reactive({
        email:'',
        password:'',
    })

    let error = ref('')

    const login = async() => {
        await axios.post('/api/login', form)
        .then(response =>{
            if(response.data.success){
                localStorage.setItem('token', response.data.data.token)
                router.push('/admin/dashboard');
            }else{
                error.value = response.data.message;
            }
        })
    }
</script>

<template>
    <div class="hold-transition login-page" style="margin-top:-60px">
        <div class="login-box">
            <div class="login-logo">
                <router-link to="/admin/login"><b>Admin</b>LTE</router-link>
            </div>

            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start your session</p>
                    <p class="login-box-msg" style="color:red" v-if="error">{{ error }}</p>
                    <form @submit.prevent="login">
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Email" required v-model="form.email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" required v-model="form.password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
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
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
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
                    <p class="mb-0">
                        <a href="register.html" class="text-center">Register a new membership</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</template>
