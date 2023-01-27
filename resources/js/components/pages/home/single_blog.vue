<script setup>
    import Header from "../layouts/header.vue";
    import SecondFooter from "../layouts/second_footer.vue";
    import moment from 'moment';
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let blog =ref([])

    onMounted(async() => {
        getSingleRecord()
    })

    const props = defineProps({
        slug:{
            type:String,
            default:""
        }
    })

    const getSingleRecord = async() =>{
        let response = await axios.get(`/api/blogs/show/${props.slug}`)
        blog.value = response.data.blog
        // console.log('response', response)
    }

    const getPost = () => {
        let post = '/public/admin/images/default.png'
        if(blog.value.post){
            if(blog.value.post.indexOf('base64') != -1){
                post = blog.value.post
            }else{
                post = '/public/admin/images/blogs/' + blog.value.post
            }
        }

        return post
    }
    const getProfile = (img) => {
        if(img==null){
            return '/public/admin/images/default.jpg'
        }
        return "/public/admin/images/blogs/" + img;
    };

</script>
<template>
    <Header />

    <!-- inner page section -->
    <section class="inner_page_head">
        <div class="container_fuild">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <h3>Single Blog</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end inner page section -->
    <!-- product section -->
    <section class="product_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 mb-5">
                    <div class="card " style="height:100%">
                        <div class="card-header border-none p-0" style="min-height:125px; max-height:1205px;">
                            <img :src="getPost(blog.post)" alt="" style="width:100%;  margin:0 auto" >
                        </div>

                        <div class="card-body">
                            <h6 class="card-title">
                                <img :src="getProfile(blog.user_profile)" alt="" class="rounded" style="width:5%;  margin:0 auto" >
                                <b> {{ blog.user_name }}</b> | {{ moment(blog.created_at).format('DD-MM-YYYY | h:s A') }}
                            </h6>
                            <h5 class="card-title">{{ blog.title }}</h5>
                            <p class="card-text">
                                {{ blog.short_description }}
                            </p>
                            <p class="card-text">
                                {{ blog.full_description }}
                            </p>
                            <button class="btn btn-default btn-sm" title="Like this post"><i class="fa fa-thumbs-up"></i></button>
                            <button class="btn btn-default btn-sm" title="DisLike this post"><i class="fa fa-thumbs-down"></i></button>
                            <button class="btn btn-default btn-sm" title="Comments this post"><i class="fa fa-comments"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end product section -->

    <SecondFooter />
</template>
