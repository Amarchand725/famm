<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        id:'',
        currency:'',
        currency_symbol:'',
        fast_delivery:'',
        free_shipping:'',
        best_quality:'',
        banner:'',
        banner_title:'',
        banner_content:'',
        subscriber_content:'',
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
        let response = await axios.get(`/api/admin/about_us/show/1`)
        form.value = response.data.model
        console.log('response', response)
    }

    const getBanner = () => {
        let banner = '/public/admin/images/default.jpg'
        if(form.value.banner){
            if(form.value.banner.indexOf('base64') != -1){
                banner = form.value.banner
            }else{
                banner = '/public/admin/images/about_us/' + form.value.banner
            }
        }

        return banner
    }

    const onEdit = (id) => {
        router.push('/admin/about_us/edit/'+id)
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
                            <h1>ABOUT US FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="About Us">About Us </li>
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
                                    <h3 class="card-title">Show About Us Details <button class="btn btn-info btn-sm" @click="onEdit(form.id)"><i class="fa fa-edit"></i> Edit</button></h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5>Banner</h5>
                                        </div>
                                        <div class="col-md-8">
                                           <img :src="getBanner(form.banner)" class="project_img-list" style="width:100px">
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Currency</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.currency }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Currency Symbol</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.currency_symbol }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Fast Delivery</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.fast_delivery }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Free Shipping</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.free_shipping }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Best Quality</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.best_quality }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Banner Title</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.banner_title }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Banner Content</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.banner_content }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Subscriber Content</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.subscriber_content }}</p>
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
