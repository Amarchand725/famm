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

    const changeBanner = (e) => {
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
            form.value.banner = reader.result
        }
        reader.readAsDataURL(file)
    }

    const updateRecord = async () => {
        await axios.post(`/api/admin/about_us/update/${form.value.id}`, form.value)
        .then(response => {
            router.push('/admin/about_us/show/1')
            toast.fire({
                icon:'success',
                title:'About us updated successfully.'
            })
        })
    }
    const showRecord = (id) => {
        router.push('/admin/about_us/show/'+id)
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
                            <h1>ABOUT US FORM</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item" title="Go to dashboard"><router-link to="/admin/dashboard">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" title="About Us"> About Us </li>
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
                                    <h3 class="card-title">EDIT ABOUT US <button class="btn btn-info btn-sm" @click="showRecord(form.id)"><i class="fa fa-eye"></i> Show</button></h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="currency">Currency <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="currency" placeholder="Enter currency" v-model="form.currency">
                                    </div>
                                    <div class="form-group">
                                        <label for="currency_symbol">Currency Symbol</label>
                                        <input type="text" class="form-control" id="currency_symbol" placeholder="Enter Sub title" v-model="form.currency_symbol">
                                    </div>
                                    <div class="form-group">
                                        <label for="fast_delivery">Fast Delivery</label>
                                        <textarea name="fast_delivery" class="form-control" id="fast_delivery" placeholder="Enter fast_delivery" v-model="form.fast_delivery"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="free_shipping">Free Shipping</label>
                                        <textarea name="free_shipping" class="form-control" id="free_shipping" placeholder="Enter free_shipping" v-model="form.free_shipping"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="best_quality">Best Quality</label>
                                        <textarea name="best_quality" class="form-control" id="best_quality" placeholder="Enter best_quality" v-model="form.best_quality"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="banner_title">Banner Title</label>
                                        <textarea name="banner_title" class="form-control" id="banner_title" placeholder="Enter banner_title" v-model="form.banner_title"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="banner_content">Banner Content</label>
                                        <textarea name="banner_content" class="form-control" id="banner_content" placeholder="Enter banner_content" v-model="form.banner_content"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="subscriber_content">Subscriber Content</label>
                                        <textarea name="subscriber_content" class="form-control" id="subscriber_content" placeholder="Enter subscriber_content" v-model="form.subscriber_content"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="banner">Banner <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" accept="image/*" class="custom-file-input" id="banner" @change="changeBanner">
                                                <label class="custom-file-label" for="banner">Choose banner</label>
                                            </div>
                                        </div>
                                        <div class="project_img-container">
                                            <img :src="getBanner()" class="project_img" style="width:100px; height:50px">
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
