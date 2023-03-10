import { createRouter, createWebHistory } from "vue-router";
//admin
import AdminDashboard from '../admin/home/index.vue'
import AdminLogin from '../admin/home/auth/login.vue'

import Slider from '../admin/slider/index.vue'
import CreateSlider from '../admin/slider/create.vue'
import EditSlider from '../admin/slider/edit.vue'
import ShowSlider from '../admin/slider/show.vue'

import Product from '../admin/products/index.vue'
import CreateProduct from '../admin/products/create.vue'
import EditProduct from '../admin/products/edit.vue'
import ShowProduct from '../admin/products/show.vue'

import Subscriber from '../admin/subscribers/index.vue'
import AdminTestimonial from '../admin/testimonials/index.vue'

import AdminBlog from '../admin/blogs/index.vue'
import CreateBlog from '../admin/blogs/create.vue'
import EditBlog from '../admin/blogs/edit.vue'
import ShowBlog from '../admin/blogs/show.vue'

import AdminContactedUs from '../admin/contacted_us/index.vue'
import ShowContactedUs from '../admin/contacted_us/show.vue'

import ShowSetting from '../admin/settings/show.vue'
import EditSetting from '../admin/settings/edit.vue'

import ShowAboutUs from '../admin/about_us/show.vue'
import EditAboutUs from '../admin/about_us/edit.vue'

//pages
import Home from '../pages/home/index.vue'
import Shop from '../pages/home/shop.vue'
import SingleProduct from '../pages/home/single_product.vue'
import Blogs from '../pages/home/blogs.vue'
import SingleBlog from '../pages/home/single_blog.vue'
import Contact from '../pages/home/contact.vue'
import About from '../pages/home/about.vue'
import Testimonial from '../pages/home/testimonial.vue'
import OpenCart from '../pages/home/cart.vue'

//notfound
import notFound from '../notFound.vue'

const routes = [
    //admin
    {
        path:'/admin/about_us/edit/:id',
        name: 'EditAboutUs',
        component: EditAboutUs,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/about_us/show/:id',
        name: 'ShowAboutUs',
        component: ShowAboutUs,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/setting/edit/:id',
        name: 'EditSetting',
        component: EditSetting,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/setting/show/:id',
        name: 'ShowSetting',
        component: ShowSetting,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/contacted_us/show/:id',
        name: 'ShowContactedUs',
        component: ShowContactedUs,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path: '/admin/contacted_us',
        name: 'AdminContactedUs',
        component: AdminContactedUs,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/blogs/show/:id',
        name: 'ShowBlog',
        component: ShowBlog,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/blogs/edit/:id',
        name: 'EditBlog',
        component: EditBlog,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path: '/admin/blogs/create',
        name: 'CreateBlog',
        component: CreateBlog,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/blogs',
        name: 'AdminBlog',
        component: AdminBlog,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/products/show/:id',
        name: 'ShowProduct',
        component: ShowProduct,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/products/edit/:id',
        name: 'EditProduct',
        component: EditProduct,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path: '/admin/products/create',
        name: 'CreateProduct',
        component: CreateProduct,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/products',
        name: 'product',
        component: Product,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/sliders',
        name: 'slider',
        component: Slider,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/slider/show/:id',
        name: 'ShowSlider',
        component: ShowSlider,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/slider/edit/:id',
        name: 'EditSlider',
        component: EditSlider,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path: '/admin/slider/create',
        name: 'CreateSlider',
        component: CreateSlider,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/testimonials',
        name: 'AdminTestimonial',
        component: AdminTestimonial,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/subscribers',
        name: 'subscriber',
        component: Subscriber,
        meta:{
            requiresAuth: true
        }
    },

    {
        path: '/admin/dashboard',
        name: 'AdminDashboard',
        component: AdminDashboard,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/login',
        name: 'AdminLogin',
        component: AdminLogin,
        meta:{
            requiresAuth: false
        }
    },

    //pages
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/shop',
        name: 'Shop',
        component: Shop
    },
    {
        path:'/shop/products/show/:slug',
        name: 'SingleProduct',
        component: SingleProduct,
        props: true
    },
    {
        path: '/blogs',
        name: 'Blogs',
        component: Blogs
    },
    {
        path:'/blogs/show/:slug',
        name: 'SingleBlog',
        component: SingleBlog,
        props: true
    },
    {
        path: '/contact',
        name: 'Contact',
        component: Contact
    },
    {
        path: '/testimonial',
        name: 'Testimonial',
        component: Testimonial
    },
    {
        path: '/about',
        name: 'About',
        component: About
    },
    {
        path: '/cart/open',
        name: 'OpenCart',
        component: OpenCart,
    },
    //notFound
    {
        path: '/:pathMatch(.*)*)',
        name: 'notFound',
        component: notFound
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

router.beforeEach((to, from) => {
    if(to.meta.requiresAuth && !localStorage.getItem('token')){
        return { name: 'AdminLogin' }
    }
    if(to.meta.requiresAuth == false && localStorage.getItem('token')){
        return { name: 'AdminDashboard' }
    }
})

export default router;
