<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        id:'',
        title:'',
        price:'',
        sale_price:'',
        description:'',
        thumbnail:'',
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
        let response = await axios.get(`/api/admin/products/show/${props.id}`)
        form.value = response.data.model
    }

     const getThumbnail = () => {
        let thumbnail = '/public/admin/images/default.png'
        if(form.value.thumbnail){
            if(form.value.thumbnail.indexOf('base64') != -1){
                thumbnail = form.value.thumbnail
            }else{
                thumbnail = '/public/admin/images/products/thumbnails/' + form.value.thumbnail
            }
        }

        return thumbnail
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
                                <li class="breadcrumb-item active" title="Go to Products list"><router-link to="/admin/products"> All Products </router-link></li>
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
                                            <h5>Price</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.price }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Sale Price</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.sale_price }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Description</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.description }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Status</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <span class="badge badge-success" v-if="form.status">Activated</span>
                                            <span class="badge badge-danger" v-else>Deactivated</span>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Thumbnail</h5>
                                        </div>
                                        <div class="col-md-8">
                                           <img :src="getThumbnail(form.thumbnail)" class="project_img-list" style="width:100px">
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
