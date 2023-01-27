<script setup>
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let subscribe = ref({
        email: '',
    })
    let form = ref({
        name: '',
        address: '',
        phone: '',
        email: '',
        about_us: '',
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
    <!-- footer section -->
    <footer class="footer_section">
        <div class="container">
        <div class="row">
            <div class="col-md-4 footer-col">
                <div class="footer_contact">
                    <h4>
                    Reach at..
                    </h4>
                    <div class="contact_link_box">
                    <a href="">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                    <span>
                    Location : {{ form.address }}
                    </span>
                    </a>
                    <a href="">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    <span>
                    Call {{ form.phone }}
                    </span>
                    </a>
                    <a href="">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    <span>
                    {{ form.email }}
                    </span>
                    </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <div class="footer_detail">
                    <router-link to="/" class="footer-logo">
                    {{ form.name }}
                    </router-link>
                    <p>{{ form.about_us }}</p>
                    <div class="footer_social">
                    <a href="">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                    </a>
                    <a href="">
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                    </a>
                    <a href="">
                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                    </a>
                    <a href="">
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                    </a>
                    <a href="">
                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                    </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <div class="map_container">
                    <div class="map">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-info">
            <div class="col-lg-7 mx-auto px-0">
                <p>
                    &copy; <span id="displayYear"></span> All Rights Reserved By
                    <router-link to="/">{{ form.name }}</router-link><br>

                    Distributed By <router-link to="/" target="_blank">{{ form.name }}</router-link>
                </p>
            </div>
        </div>
        </div>
    </footer>
    <!-- footer section -->
</template>
