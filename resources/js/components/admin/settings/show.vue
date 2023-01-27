<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        id:'',
        name:'',
        address:'',
        phone:'',
        email:'',
        about_us:'',
        logo:'',
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

    const onEdit = (id) => {
        router.push('/admin/setting/edit/'+id)
    }
</script>
<template>
    <div class="wrapper">
        <!-- Navbar -->
        <TopNavigation />
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <Sidebar />
        <!-- Main Sidebar Container -->
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" style="min-height: 2080.12px;">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>SETTING FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="Go to sliders list">Settings </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Show Setting Details <button class="btn btn-info btn-sm" @click="onEdit(form.id)"><i class="fa fa-edit"></i> Edit</button></h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5>Logo</h5>
                                        </div>
                                        <div class="col-md-8">
                                           <img :src="getLogo(form.logo)" class="project_img-list" style="width:100px">
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Name</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.name }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Address</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.address }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Phone</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.phone }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Email</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.email }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>About Us</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.about_us }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>
