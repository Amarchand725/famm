<script setup>
    import Header from "../layouts/header.vue";
    import SecondFooter from "../layouts/second_footer.vue";
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const form = ref({
        slug: '',
        title: '',
        short_description: '',
        full_description: '',
        post: '',
    })

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
        let response = await axios.get(`/api/${props.slug}`)
        form.value = response.data.blog
        console.log('response', response)
    }

    const getPost = () => {
        let post = '/public/admin/images/default.png'
        if(form.value.post){
            if(form.value.post.indexOf('base64') != -1){
                post = form.value.post
            }else{
                post = '/public/admin/images/blogs/' + form.value.post
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
                            <img :src="getPost(form.post)" alt="" style="width:100%;  margin:0 auto" >
                        </div>

                        <div class="card-body">
                            <h6 class="card-title">
                                <img :src="getProfile(form.created_by.profile)" alt="" class="rounded" style="width:5%;  margin:0 auto" >
                                <b> {{ form.created_by.name }}</b> | {{ form.formatted_created_at }}
                            </h6>
                            <h5 class="card-title">{{ form.title }}</h5>
                            <p class="card-text">
                                {{ form.short_description }}
                            </p>
                            <p class="card-text">
                                {{ form.full_description }}
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
