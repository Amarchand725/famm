<script setup>
    import Header from '../layouts/header.vue'
    import SecondFooter from '../layouts/second_footer.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let product =ref([])

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
        let response = await axios.get(`/api/shop/products/show/${props.slug}`)
        product.value = response.data.product
        console.log('response', response)
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
                        <h3>Single Product</h3>
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
                <div class="col-sm-6 mb-6">
                    <div class="card " style="height:100%">
                        <div class="card-header border-none p-0" style="min-height:125px; max-height:1205px;">
                            <img :src="getImage(product.thumbnail)" alt="" style="width:100%;  margin:0 auto" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 mb-6">
                    <div class="card " style="height:100%">
                        <div class="card-body">
                            <h5 class="card-title">{{ product.title }}</h5>
                            <p class="card-text">
                                {{ product.description }}
                            </p>
                            <h5 class="card-title">
                                Price:
                                <span v-if="product.sale_price > 0">${{ product.sale_price }}</span>
                                <small v-if="product.price > 0" style="margin-left:30px; text-decoration: line-through;">${{ product.price }}</small>
                            </h5>
                            <h5 class="card-title">
                                Rating:
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </h5>
                            <h5 class="card-title">
                                Stock: <span>5</span>
                            </h5>
                            <span class="col-sm-2">
                                <input type="number" value="1" min="1" class="form-control col-sm-4">
                            </span>
                            <h5 class="card-title">
                                <button class="btn btn-info">Add to cart</button>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end product section -->

    <SecondFooter />
</template>
