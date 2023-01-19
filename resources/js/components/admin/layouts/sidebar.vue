<script setup>
    import { onMounted,ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()
    const user = ref({
        name:'',
        photo:'',
        logo:'',
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
        let photo = '/public/admin/dist/img/user2-160x160.jpg'
        if(user.value.photo){
            if(user.value.photo.indexOf('base64') != -1){
                photo = user.value.photo
            }else{
                photo = '/img/upload/' + user.value.photo
            }
        }

        return photo
    }

    const getLogo = () => {
        let logo = '/public/admin/dist/img/AdminLTELogo.png'
        if(user.value.logo){
            if(user.value.logo.indexOf('base64') != -1){
                logo = user.value.logo
            }else{
                logo = '/img/upload/' + user.value.logo
            }
        }

        return logo
    }

    const logout = () => {
        localStorage.removeItem('token')
        router.push('/admin/login')
    }
</script>
<template>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="index3.html" class="brand-link">
            <img :src="getLogo()" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img :src="getPhoto()" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                        with font-awesome or any other icon font library -->
                    <li class="nav-item menu-open">
                        <router-link to="/admin/dashboard" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>Dashboard</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>
                                Settings
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item active">
                                <a href="#" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Settings</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Permissions</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Roles</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/sliders" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Sliders
                            </p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/products" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Products
                            </p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/subscribers" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Subscribers
                            </p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/testimonials" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Testimonials
                            </p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/blogs" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Blogs
                            </p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/admin/contacted_us" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Contacted Us
                            </p>
                        </router-link>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
</template>
