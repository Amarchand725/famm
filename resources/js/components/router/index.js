import { createRouter, createWebHistory } from "vue-router";
//admin
import AdminDashboard from '../admin/home/index.vue'
import AdminLogin from '../admin/home/auth/login.vue'
import Slider from '../admin/slider/index.vue'
import Product from '../admin/products/index.vue'
import Subscriber from '../admin/subscribers/index.vue'
import AdminTestimonial from '../admin/testimonials/index.vue'
import AdminBlog from '../admin/blogs/index.vue'
import AdminContactedUs from '../admin/contacted_us/index.vue'

//pages
import Home from '../pages/home/index.vue'
import Shop from '../pages/home/shop.vue'
import Blogs from '../pages/home/blogs.vue'
import Contact from '../pages/home/contact.vue'
import About from '../pages/home/about.vue'
import Testimonial from '../pages/home/testimonial.vue'

//notfound
import notFound from '../notFound.vue'

const routes = [
    //admin
    {
        path: '/admin/contacted_us',
        name: 'AdminContactedUs',
        component: AdminContactedUs,
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
        path: '/admin/products',
        name: 'product',
        component: Product,
        meta:{
            requiresAuth: true
        }
    },
    {
        path: '/admin/slider',
        name: 'slider',
        component: Slider,
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
        path: '/blogs',
        name: 'Blogs',
        component: Blogs
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
