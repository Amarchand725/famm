<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let models = ref([])

    onMounted(async() => {
        getRecords()
    })

    const getRecords = async () => {
        let  response = await axios.get('/api/admin/sliders')
        models.value = response.data.models
    }

    const getImage = (img) => {
        return '/public/admin/images/sliders/'+img
    }

    const create = () => {
        router.push('/admin/slider/create')
    }

    const onEdit = (id) => {
        router.push('/admin/slider/edit/'+id)
    }

    const showRecord = (id) => {
        router.push('/admin/slider/show/'+id)
    }

    const deleteRecord = (id) => {
        Swal.fire({
            title: 'Are you sure?',
            text: "You can't back",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes, Delete it',
        })
        .then((result) => {
            if(result.value){
                axios.get('/api/admin/slider/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'Slider delete successfully',
                        'success',
                    )
                    getRecords()
                })
            }
        })
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
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>All Sliders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><router-link to="/admin/dashboard">Home</router-link></li>
                                <li class="breadcrumb-item active">Sliders</li>
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
                                    <h3 class="card-title">All Records</h3>
                                    <div class="card-tools">
                                        <div class="input-group input-group-sm" style="width: 550px;">
                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-default">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>
                                            <div class="input-group-append ml-2">
                                                <button type="submit" class="btn btn-info" @click="create()">
                                                    <i class="fas fa-plus"></i> Add New
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Title</th>
                                                <th>Sub Title</th>
                                                <th>Created At</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody v-if="models.length > 0">
                                            <tr v-for="model in models" :key="model.id">
                                                <td>{{ model.id }}.</td>
                                                <td>
                                                    <img :src="getImage(model.image)" class="project_img-list" style="width:50px">
                                                </td>
                                                <td>{{ model.title }}</td>
                                                <td>{{ model.sub_title }}</td>
                                                <td>{{ model.created_at }}</td>
                                                <td>
                                                    <span class="badge badge-success" v-if="model.status">Activated</span>
                                                    <span class="badge badge-danger" v-else>Deactivated</span>
                                                </td>
                                                <td>
                                                    <button class="btn btn-info btn-sm" title="Edit" @click="onEdit(model.id)"><i class="fa fa-edit"></i></button>
                                                    <button class="btn btn-primary btn-sm ml-1" title="Show" @click="showRecord(model.id)"><i class="fa fa-eye"></i></button>
                                                    <button class="btn btn-danger btn-sm ml-1" title="Delete" @click="deleteRecord(model.id)"><i class="fa fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>
