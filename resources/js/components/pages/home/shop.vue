<script setup>
    import Header from '../layouts/header.vue'
    import SecondFooter from '../layouts/second_footer.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let products =ref([])

    onMounted(async() => {
        getProducts()
    })

    const getProducts = async () => {
        let  response = await axios.get('/api/web/products')
        products.value = response.data.products
    }

    const getImage = (img) => {
        return '/public/admin/images/products/thumbnails/'+img
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
                        <h3>Product Grid</h3>
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
                <h2>
                    Our <span>products</span>
                </h2>
            </div>
            <div class="row" v-if="products.length > 0">
                <div class="col-sm-6 col-md-4 col-lg-3" v-for="product in products" :key="product.id">
                    <div class="box">
                        <div class="option_container">
                            <div class="options">
                                <a href="" class="option1">
                                    Add To Cart
                                </a>
                                <a href="" class="option2">
                                    Buy Now
                                </a>
                            </div>
                        </div>
                        <div class="img-box">
                            <img :src="getImage(product.thumbnail)" alt="">
                        </div>
                        <div class="detail-box">
                            <h5>{{ product.title }}</h5>
                            <h6>${{ product.price }}</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" v-else>
                <div class="col-sm-6 col-md-6 col-lg-6">
                    <h1>No Products Found</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- end product section -->

    <SecondFooter />
</template>
