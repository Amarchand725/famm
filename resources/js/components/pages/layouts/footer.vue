<script setup>
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let subscribe = ref({
        email: '',
    })
    let form = ref({
        address: '',
        phone: '',
        email: '',
        logo: '',
    })

    onMounted(async() => {
        getSingleRecord()
    })

    const props = defineProps({
        id:{
            type:String,
            default:""
        }
    })

    const getSingleRecord = async() =>{
        let response = await axios.get(`/api/admin/setting/show/1`)
        form.value = response.data.model
    }

    const getLogo = () => {
        let logo = '/public/admin/images/default.jpg'
        if(form.value.logo){
            if(form.value.logo.indexOf('base64') != -1){
                logo = form.value.logo
            }else{
                logo = '/public/admin/images/settings/' + form.value.logo
            }
        }

        return logo
    }

    const SubscriberSave = async() => {
        await axios.post('/api/web/subscribers/create', subscribe.value)
        .then((response) => {
            toast.fire({
                icon: 'success',
                title: 'You have subscribed Successfully.',
            })

            subscribe.value.email = ''
        }).catch((error) => {
            if(error.response.status == 422){
                errors.value = error.response.data.errors
            }
        })
    }
</script>
<template>
    <!-- footer start -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="full">
                        <div class="logo_footer">
                            <router-link class="navbar-brand" to="/">
                                <img style="width:250px; height:50px" :src="getLogo(form.logo)" alt="#" />
                            </router-link>
                        </div>
                        <div class="information_f">
                            <p><strong>ADDRESS:</strong> {{ form.address }}</p>
                            <p><strong>TELEPHONE:</strong> {{ form.phone }}</p>
                            <p><strong>EMAIL:</strong> {{ form.email }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="widget_menu">
                                <h3>Menu</h3>
                                <ul>
                                    <li><router-link to="/">Home</router-link></li>
                                    <li><router-link to="/about">About</router-link></li>
                                    <li><router-link to="/testimonials">Testimonial</router-link></li>
                                    <li><router-link to="/blog">Blog</router-link></li>
                                    <li><router-link to="/contact">Contact</router-link></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="widget_menu">
                                <h3>Newsletter</h3>
                                <div class="information_f">
                                    <p>Subscribe by our newsletter and get update protidin.</p>
                                </div>
                                <div class="form_sub">
                                    <form>
                                        <fieldset>
                                            <div class="field">
                                                <input type="email" placeholder="Enter Your Mail" name="email" v-model="subscribe.email" />
                                                <button class="h-48" type="button" @click="SubscriberSave()">Subscribe</button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer end -->
    <div class="cpy_">
        <p class="mx-auto">
            © {{ new Date().getFullYear() }} All Rights Reserved By
            <router-link class="navbar-brand" to="/">
                <img style="width:50px; height:20px" :src="getLogo(form.logo)" alt="#" />
            </router-link><br>
            Distributed By
            <router-link class="navbar-brand" to="/">
                <img style="width:50px; height:20px" :src="getLogo(form.logo)" alt="#" />
            </router-link>
        </p>
    </div>
</template>
