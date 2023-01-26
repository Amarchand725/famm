<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'

    import { ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let form = ref({
        title: '',
        price: '',
        sale_price: '',
        description: '',
        thumbnail: ''
    })

    const errors = ref({})

    const getThumbnail = () => {
        let thumbnail = '/public/admin/images/default.jpg'
        if(form.value.thumbnail){
            if(form.value.thumbnail.indexOf('base64') != -1){
                thumbnail = form.value.thumbnail
            }else{
                thumbnail = '/public/admin/images/products/thumbnails/' + form.value.thumbnail
            }
        }

        return thumbnail
    }

    const changeThumbnail = (e) => {
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
            form.value.thumbnail = reader.result
        }
        reader.readAsDataURL(file)
    }

    const save = async() => {
        await axios.post('/api/admin/products/create', form.value)
        .then((response) => {
            router.push('/admin/products')
            toast.fire({
                icon: 'success',
                title: 'Product Added Successfully.',
            })
            // console.log('response', response)
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
                            <h1>PRODUCT FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="Go to products list"><router-link to="/admin/products"> All Products </router-link></li>
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
                                    <h3 class="card-title">ADD NEW PRODUCT</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="title">Title <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="title" placeholder="Enter title" v-model="form.title">
                                        <small style="color:red" v-if="errors.title">{{ errors.title }}</small>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="price">Price</label>
                                                <input type="number" class="form-control" id="price" placeholder="Enter Sub title" v-model="form.price">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="sale_price">Sale Price</label>
                                                <input type="number" class="form-control" id="sale_price" placeholder="Enter Sub title" v-model="form.sale_price">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea name="description" class="form-control" id="description" placeholder="Enter description" v-model="form.description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="thumbnail">Thumbnail</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" accept="image/*" class="custom-file-input" id="thumbnail" @change="changeThumbnail">
                                                <label class="custom-file-label" for="thumbnail">Choose Thumbnail Image</label>
                                            </div>
                                        </div>
                                        <div class="project_img-container">
                                            <img :src="getThumbnail()" class="project_img" style="width:80px; height:60px">
                                        </div>
                                    </div>
                                    <!-- <div class="form-group">
                                        <label for="images">Product Images</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" accept="image/*" class="custom-file-input" id="images" @change="changeImages">
                                                <label class="custom-file-label" for="images">Choose Product Images</label>
                                            </div>
                                        </div>
                                    </div> -->
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
