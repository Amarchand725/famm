<script setup>
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let subscribe = ref({
        email: '',
    })

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
                        <a href="#"><img width="210" src="public/web/images/logo.png" alt="#" /></a>
                        </div>
                        <div class="information_f">
                            <p><strong>ADDRESS:</strong> 28 White tower, Street Name New York City, USA</p>
                            <p><strong>TELEPHONE:</strong> +91 987 654 3210</p>
                            <p><strong>EMAIL:</strong> yourmain@gmail.com</p>
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
        <p class="mx-auto">© 2023 All Rights Reserved By <a href="/">FAMM</a><br>
            Distributed By <a href="/" target="_blank">FAMM</a>
        </p>
    </div>
</template>
