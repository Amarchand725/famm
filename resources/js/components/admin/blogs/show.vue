<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        title: '',
        short_description: '',
        full_description: '',
        post: '',
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
        let response = await axios.get(`/api/admin/blogs/show/${props.id}`)
        form.value = response.data.model
    }

    const getPost = () => {
        let post = '/public/admin/images/default.png'
        if(form.value.post){
            if(form.value.post.indexOf('base64') != -1){
                post = form.value.post
            }else{
                post = '/public/admin/images/blogs/' + form.value.post
            }
        }

        return post
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
                            <h1>PRODUCT FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="Go to blogs list"><router-link to="/admin/blogs"> All Blogs </router-link></li>
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
                                    <h3 class="card-title">Show Product Details</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5>ID</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.id }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Title</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.title }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Short Description</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.short_description }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Full Description</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.full_description }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Status</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <span class="badge badge-success" v-if="form.status">Activated</span>
                                            <span class="badge badge-danger" v-else>Deactivated</span>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Post</h5>
                                        </div>
                                        <div class="col-md-8">
                                           <img :src="getPost(form.post)" class="project_img-list" style="width:100px; height:100px">
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
