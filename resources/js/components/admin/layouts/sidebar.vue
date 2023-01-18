<script setup>
    import { onMounted,ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()
    const user = ref({
        name:'',
        photo:'',
    })

    onMounted(async() => {
        getUser()
    })

    const getUser = async() =>{
        let response = await axios.get('/api/admin/user/profile')
        user.value = response.data
    }

    const myProfile = () => {
        router.push('/admin/user/profile')
    }
    const getPhoto = () => {
        let photo = '/img/upload/avatar.png'
        if(user.value.photo){
            if(user.value.photo.indexOf('base64') != -1){
                photo = user.value.photo
            }else{
                photo = '/img/upload/' + user.value.photo
            }
        }

        return photo
    }

    const logout = () => {
        localStorage.removeItem('token')
        router.push('/admin/login')
    }
</script>
<template>
    <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
                <router-link to="/admin/dashboard" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></router-link>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
            <div class="profile_pic">
                <img src="/admin/images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
            </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                <div class="menu_section">
                    <h3>General</h3>
                    <ul class="nav side-menu">
                        <li>
                            <a href="/"><i class="fa fa-globe"></i> Go to Frontend </a>
                        </li>
                        <li>
                            <router-link to="/admin/dashboard"><i class="fa fa-home"></i> Dashboard </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/slider"><i class="fa fa-sliders"></i> Slider </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/products"><i class="fa fa-product-hunt"></i> Products </router-link>
                        </li>
                         <li>
                            <router-link to="/admin/blogs"><i class="fa fa-tasks"></i> Blogs </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/subscribers"><i class="fa fa-users"></i> Subscribers </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/contacted_us"><i class="fa fa-users"></i> Contacted Us </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/testimonials"><i class="fa fa-quote-left"></i> Testimonials </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/about_us"><i class="fa fa-home"></i> About Us </router-link>
                        </li>
                        <li>
                            <router-link to="/admin/setting"><i class="fa fa-home"></i> Setting </router-link>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
                <a data-toggle="tooltip" data-placement="top" title="Settings">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                    <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="Lock">
                    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="Logout" href="#" @click="logout">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                </a>
            </div>
            <!-- /menu footer buttons -->
        </div>
    </div>
</template>
