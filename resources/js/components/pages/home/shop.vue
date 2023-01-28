<script setup>
    import Header from '../layouts/header.vue'
    import SecondFooter from '../layouts/second_footer.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let products =ref([])
    let wishlist_count = ref()
    let cart_count = ref()

    onMounted(async() => {
        getProducts()
        getWishListCount()
        getCartCount()
    })

    const getProducts = async () => {
        let token = localStorage.getItem('token')
        let  response = await axios.get(`/api/products/${token}`)
        products.value = response.data.products
    }
    const getWishListCount = async () => {
        let token = localStorage.getItem('token')
        let  response = await axios.get(`/api/wishlists/count/${token}`)
        wishlist_count.value = response.data.wishlist_count
    }

    const getImage = (img) => {
        return '/public/admin/images/products/thumbnails/'+img
    }
    const showDetail = (slug) => {
        router.push('/shop/products/show/'+slug)
    }

    let form = ref({
        slug: '',
        token: ''
    })

    const addToWishList = async(slug) => {
        let token = localStorage.getItem('token')
        form.value.token = token
        form.value.slug = slug
        await axios.post('/api/wishlists/create', form.value)
        .then((response) => {
            getWishListCount()
            getProducts()
            toast.fire({
                icon: 'success',
                title: 'Added to wishlist Successfully.',
            })
        })
    }

    const removeProductFromWishList = async(slug) => {
        let token = localStorage.getItem('token')
        form.value.token = token
        form.value.slug = slug
        await axios.post('/api/wishlists/remove/product', form.value)
        .then((response) => {
            getWishListCount()
            getProducts()
            toast.fire({
                icon: 'success',
                title: 'Removed from wishlist Successfully.',
            })
        })
    }

    const addToCart = async(slug) =>{
        let token = localStorage.getItem('token')
        form.value.token = token
        form.value.slug = slug
        await axios.post('/api/cart/add_to_cart', form.value)
        .then((response) => {
            getCartCount()
            toast.fire({
                icon: 'success',
                title: 'Added to wishlist Successfully.',
            })
        })
    }

    const getCartCount = async () => {
        let token = localStorage.getItem('token')
        let  response = await axios.get(`/api/cart/count/${token}`)
        cart_count.value = response.data.cart_count
    }
</script>
<template>
    <Header :wishlist_count=wishlist_count :cart_count=cart_count />

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
                                <a @click="addToCart(product.slug)" style="cursor: pointer;" class="option1">
                                    Add To Cart
                                </a>
                                <a style="cursor: pointer;" @click="showDetail(product.slug)" class="option2">
                                    Show Details
                                </a>
                                <a v-if="product.wishlist" style="cursor: pointer;" @click="removeProductFromWishList(product.slug)" class="option1">
                                    Remove wishlist
                                </a>
                                <a v-else style="cursor: pointer;" @click="addToWishList(product.slug)" class="option3">
                                    Add to wishlist
                                </a>
                            </div>
                        </div>
                        <div class="img-box">
                            <img :src="getImage(product.thumbnail)" alt="">
                        </div>
                        <div class="detail-box">
                            <h5>{{ product.title }}</h5>
                            <h5>
                                <b v-if="product.sale_price > 0">${{ product.sale_price }}</b>
                                <small class="ml-3" v-if="product.price > 0" style="text-decoration: line-through;">${{ product.price }}</small>
                            </h5>

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
