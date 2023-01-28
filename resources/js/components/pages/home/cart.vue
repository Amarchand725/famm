<script setup>
    import Header from '../layouts/header.vue'
    import SecondFooter from '../layouts/second_footer.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    const cart_data = ref([])
    const grand_total = ref()
    let form = ref({
        product_id: '',
        token: ''
    })

    onMounted(async() => {
        getCartProducts()
    })

    const getCartProducts = async() =>{
        let token = localStorage.getItem('token')
        let response = await axios.get('/api/cart/open/'+token)
        cart_data.value = response.data.cart_data
        grand_total.value = response.data.grand_total
    }

    const getThumbnail = (img) => {
        return '/public/admin/images/products/thumbnails/'+img
    }

    const removeItem = (id) => {
        Swal.fire({
            title: 'Are you sure?',
            text: "You can't back",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes, Remove it',
        })
        .then((result) => {
            if(result.value){
                axios.get('/api/cart/destroy/'+id)
                .then(() => {
                    getCartProducts()
                    Swal.fire(
                        'Delete',
                        'Product removed successfully',
                        'success',
                    )
                })
            }
        })
    }

    const clearCart = () =>{
        let token = localStorage.getItem('token')
        Swal.fire({
            title: 'Are you sure?',
            text: "You can't back",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes, Clear it',
        })
        .then((result) => {
            if(result.value){
                axios.get('/api/cart/clear/'+token)
                .then(() => {
                    getCartProducts()
                    Swal.fire(
                        'Delete',
                        'You have cleared cart successfully',
                        'success',
                    )
                })
            }
        })
    }
    const plus = async(product_id) =>{
        let token = localStorage.getItem('token')
        form.value.token = token
        form.value.product_id = product_id
        await axios.post('/api/cart/plus', form.value)
        .then((response) => {
            getCartProducts()
            toast.fire({
                icon: 'success',
                title: 'Increased quantity Successfully.',
            })
        })
    }
    const minus = async(product_id) =>{
        let token = localStorage.getItem('token')
        form.value.token = token
        form.value.product_id = product_id
        await axios.post('/api/cart/minus', form.value)
        .then((response) => {
            getCartProducts()
            toast.fire({
                icon: 'success',
                title: 'Decreased quantity Successfully.',
            })
        })
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
                     <h3>Cart</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end inner page section -->
      <!-- why section -->
      <section class="why_section layout_padding">
        <div class="container">
            <table class="table responsive">
                <thead>
                    <tr>
                        <th>Thumbnail</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody v-if="cart_data.length > 0">
                    <tr v-for="cart in cart_data" :key="cart.id">
                        <td>
                            <img :src="getThumbnail(cart.thumbnail)" class="project_img-list" style="width:50px">
                        </td>
                        <td>{{ cart.title }}</td>
                        <td>${{ cart.price }}</td>
                        <td>
                            <button @click="plus(cart.product_id)"><i class="fa fa-plus"></i></button>
                            <span style="font-size:25px; padding:8px">{{ cart.quantity }}</span>
                            <button @click="minus(cart.product_id)"><i class="fa fa-minus"></i></button>
                        </td>
                        <td>${{ cart.sub_total }}</td>
                        <td>
                            <button class="btn btn-danger" @click="removeItem(cart.id)"><i class="fa fa-times"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="4">Total</th>
                        <th colspan="1">${{ grand_total }}</th>
                        <th>
                            <button class="btn btn-info btn-sm" @click="clearCart()">Clear Cart</button>
                        </th>
                    </tr>
                </tbody>
                <tbody v-else>
                    <tr class="text-center">
                        <td colspan="6"><h2>Cart is empty</h2>  <router-link class="btn btn-info" to="/shop">Go to Shop</router-link></td>
                    </tr>
                </tbody>
            </table>
        </div>
      </section>
      <!-- end why section -->
    <SecondFooter />
</template>
