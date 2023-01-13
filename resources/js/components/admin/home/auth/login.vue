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
    <div>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form @submit.prevent="login">
              <h1>ADMIN LOGIN</h1>
              <h5 style="color:red" v-if="error">{{ error }}</h5>
              <div>
                <input type="email" class="form-control" placeholder="Username" required="" v-model="form.email" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" v-model="form.password" />
              </div>
              <div style="text-align:right">
                <button type="submit" class="btn btn-success submit">Log in</button>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <div>
                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                  <p>©2023 All Rights Reserved. Gentelella Alela! . Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
</template>
