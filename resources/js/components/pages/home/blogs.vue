<script setup>
    import Header from "../layouts/header.vue";
    import SecondFooter from "../layouts/second_footer.vue";
    import moment from 'moment';
    import { onMounted, ref } from "vue";
    import { useRouter } from "vue-router";

    const router = useRouter();

    let blogs = ref([]);

    onMounted(async () => {
        getBlogs();
    });

    const getBlogs = async () => {
        let response = await axios.get("/api/web/blogs");
        blogs.value = response.data.blogs;
    };

    const getImage = (img) => {
        return "/public/admin/images/blogs/" + img;
    };

    const getProfile = (img) => {
        if(img==null){
            return '/public/admin/images/default.jpg'
        }
        return "/public/admin/images/blogs/" + img;
    };

    const showBlog = (slug) => {
        router.push('/'+slug)
    }

</script>
<template>
    <Header />

    <!-- inner page section -->
    <section class="inner_page_head">
        <div class="container_fuild">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <h3>Blog Grid</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end inner page section -->
    <!-- product section -->
    <section class="product_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Our <span>Blogs</span></h2>
            </div>
            <div class="row" v-if="blogs.length > 0">
                <div class="col-sm-6 mb-5" v-for="blog in blogs" :key="blog.id">
                    <div class="card " style="height:100%">
                        <div class="card-header border-none p-0" style="min-height:125px; max-height:1205px;">
                             <img :src="getImage(blog.post)" alt="" style="width:100%;  margin:0 auto" >
                        </div>

                        <div class="card-body">
                            <h6 class="card-title">
                                <img :src="getProfile(blog.created_by.profile)" alt="" class="rounded" style="width:5%;  margin:0 auto" >
                                <b> {{ blog.created_by.name }}</b> | {{ blog.formatted_created_at }}
                            </h6>
                            <h5 class="card-title">{{ blog.title }}</h5>
                            <p class="card-text">
                                {{ blog.short_description }}
                            </p>
                            <button title="Open this blog" class="btn btn-primary" @click="showBlog(blog.slug)">Open</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" v-else>
                <div class="col-sm-6 col-md-6 col-lg-6">
                    <h1>No Blog Found</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- end product section -->

    <SecondFooter />
</template>
