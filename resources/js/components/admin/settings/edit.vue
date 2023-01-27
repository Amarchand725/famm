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

    const changeLogo = (e) => {
        let file = e.target.files[0];
        let reader = new FileReader();
        let limit = 1024*1024*2
        if( file['size'] > limit ){
            swal({
                icon:'error',
                title: 'Oops...',
                text: 'You are uploading  a large file'
            })
            return false
        }
        reader.onloadend =(file) => {
            form.value.logo = reader.result
        }
        reader.readAsDataURL(file)
    }

    const updateRecord = async () => {
        await axios.post(`/api/admin/setting/update/${form.value.id}`, form.value)
        .then(response => {
            router.push('/admin/setting/show/1')
            toast.fire({
                icon:'success',
                title:'Setting updated successfully.'
            })
        })
    }
    const showRecord = (id) => {
        router.push('/admin/setting/show/'+id)
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
                                <li class="breadcrumb-item active" title="Go to sliders list"> Setting </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">EDIT SETTING <button class="btn btn-info btn-sm" @click="showRecord(form.id)"><i class="fa fa-eye"></i> Show</button></h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="name">Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="name" placeholder="Enter name" v-model="form.name">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" id="phone" placeholder="Enter Sub title" v-model="form.phone">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <textarea name="email" class="form-control" id="email" placeholder="Enter email" v-model="form.email"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <textarea name="address" class="form-control" id="address" placeholder="Enter address" v-model="form.address"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="about_us">About Us</label>
                                        <textarea name="about_us" class="form-control" id="about_us" placeholder="Enter about_us" v-model="form.about_us"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="logo">Logo <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" accept="image/*" class="custom-file-input" id="logo" @change="changeLogo">
                                                <label class="custom-file-label" for="logo">Choose Logo</label>
                                            </div>
                                        </div>
                                        <div class="project_img-container">
                                            <img :src="getLogo()" class="project_img" style="width:100px; height:50px">
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary" @click="updateRecord()">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>
