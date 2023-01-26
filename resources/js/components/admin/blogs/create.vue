<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'

    import { ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let form = ref({
        title: '',
        short_description: '',
        full_description: '',
        post: '',
        token: ''
    })

    const errors = ref({})

    const getPost = () => {
        let post = '/public/admin/images/default.jpg'
        if(form.value.post){
            if(form.value.post.indexOf('base64') != -1){
                post = form.value.post
            }else{
                post = '/public/admin/images/blogs/' + form.value.post
            }
        }

        return post
    }

    const changePost = (e) => {
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
            form.value.post = reader.result
        }
        reader.readAsDataURL(file)
    }

    const save = async() => {
        let token = localStorage.getItem('token')
        form.value.token = token
        await axios.post('/api/admin/blogs/create', form.value)
        .then((response) => {
            router.push('/admin/blogs')
            toast.fire({
                icon: 'success',
                title: 'Blog Added Successfully.',
            })
        }).catch((error) => {
            if(error.response.status == 422){
                errors.value = error.response.data.errors
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
        <div class="content-wrapper" style="min-height: 2080.12px;">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>BLOG FORM</h1>
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
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">ADD NEW BLOG</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="title">Title <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="title" placeholder="Enter title" v-model="form.title">
                                        <small style="color:red" v-if="errors.title">{{ errors.title }}</small>
                                    </div>

                                    <div class="form-group">
                                        <label for="short_description">Short Description</label>
                                        <textarea name="short_description" class="form-control" id="short_description" placeholder="Enter short description" v-model="form.short_description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="full_description">Full Description</label>
                                        <textarea name="full_description" class="form-control" id="full_description" placeholder="Enter full description" v-model="form.full_description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="post">Post</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="post" @change="changePost">
                                                <label class="custom-file-label" for="post">Choose Post Image</label>
                                            </div>
                                        </div>
                                        <div class="project_img-container">
                                            <img :src="getPost()" class="project_img" style="width:80px; height:60px">
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary" @click="save()">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>
