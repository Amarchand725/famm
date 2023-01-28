<script setup>
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let token = localStorage.getItem('token')
    if(token == ""){
        token = '1'
    }

    const form = ref({
        logo:'',
    })

    onMounted(async() => {
        getSingleRecord()
    })

    const props = defineProps({
        id:{
            type:String,
            default:""
        },
        wishlist_count:{
            type:Number,
            default:0
        },
        cart_count:{
            type:Number,
            default:0
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

    const openCart = () =>{
        router.push('/cart/open')
    }
</script>
<template>
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <router-link class="navbar-brand" to="/">
                    <img style="width:250px; height:50px" :src="getLogo(form.logo)" alt="#" />
                </router-link>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <router-link class="nav-link" to="/">Home <span class="sr-only">(current)</span></router-link>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                <span class="nav-label">Pages </span><span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><router-link to="/about">About</router-link></li>
                                <li><router-link to="/testimonial">Testimonial</router-link></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/shop">Shop</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/blogs">Blog</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/contact">Contact</router-link>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fa fa-heart"></i>
                                <span class="badge badge-info">{{ wishlist_count }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="cursor: pointer;" @click="openCart()">
                                <i class="fa fa-shopping-cart"></i> <span class="badge badge-info">{{ cart_count }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <router-link to="/login" class="nav-link" v-if="token==1">
                                <i class="fa fa-user"></i> Login {{ token }}
                            </router-link>
                            <router-link to="/user/dashboard" class="nav-link" v-else>
                                <i class="fa fa-home"></i> Dashboard
                            </router-link>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
</template>
