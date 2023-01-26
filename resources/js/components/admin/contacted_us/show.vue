<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        id:'',
        name:'',
        email:'',
        subject:'',
        message:'',
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
        let response = await axios.get(`/api/admin/contacted_us/show/${props.id}`)
        form.value = response.data.model
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
                            <h1>CONTACTED US FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="Go to contacted us list"><router-link to="/admin/contacted_us"> All Contacted Us </router-link></li>
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
                                    <h3 class="card-title">Show Contacted Us Details</h3>
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
                                            <h5>Name</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.name }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Email</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.email }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Subject</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.subject }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Message</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <p>{{ form.message }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>Status</h5>
                                        </div>
                                        <div class="col-md-8">
                                            <span class="badge badge-success" v-if="form.status">Activated</span>
                                            <span class="badge badge-danger" v-else>Deactivated</span>
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
