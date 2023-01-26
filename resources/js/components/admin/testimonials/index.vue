<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let records =ref([])

    onMounted(async() => {
        getRecords()
    })

    const getRecords = async () => {
        let  response = await axios.get('/api/admin/testimonials')
        records.value = response.data.records
    }

    const getImage = (img) => {
        if(img==null){
            return '/public/admin/images/default.jpg'
        }
        return '/public/admin/images/profiles/'+img
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
                axios.get('/api/admin/testimonials/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'Testimonial delete successfully',
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
                            <h1>All Testimonials</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><router-link to="/admin/dashboard">Home</router-link></li>
                                <li class="breadcrumb-item active"><router-link to="/admin/testimonials">Testimonials</router-link></li>
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
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Profile</th>
                                                <th>Name</th>
                                                <th>Testimonial</th>
                                                <th>Created At</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody v-if="records.length > 0">
                                            <tr v-for="record in records" :key="record.id">
                                                <td>{{ record.id }}.</td>
                                                <td>
                                                    <img :src="getImage(record.user.profile)" class="project_img-list" style="width:50px">
                                                </td>
                                                <td>{{ record.user.name }}</td>
                                                <td>{{ record.testimonial }}</td>
                                                <td>{{ record.created_at }}</td>
                                                <td>
                                                    <span class="badge badge-success" v-if="record.status">Activated</span>
                                                    <span class="badge badge-danger" v-else>Deactivated</span>
                                                </td>
                                                <td>
                                                    <button class="btn btn-danger btn-sm ml-1" data-toggle="tooltip" data-placement="top" title="Delete" @click="deleteRecord(record.id)"><i class="fa fa-trash"></i></button>
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
