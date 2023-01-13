import { createRouter, createWebHistory } from "vue-router";
//admin
import AdminDashboard from '../admin/home/index.vue'
import AdminLogin from '../admin/home/auth/login.vue'

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
        path: '/admin/login',
        name: 'AdminLogin',
        component: AdminLogin,
        meta:{
            requiresAuth: false
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
    //pages
    {
        path: '/',
        name: 'Home',
        component: Home,
        meta:{
            requiresAuth: false
        }
    },
    {
        path: '/shop',
        name: 'Shop',
        component: Shop,
        meta:{
            requiresAuth: false
        }
    },
    {
        path: '/blogs',
        name: 'Blogs',
        component: Blogs,
        meta:{
            requiresAuth: false
        }
    },
    {
        path: '/contact',
        name: 'Contact',
        component: Contact,
        meta:{
            requiresAuth: false
        }
    },
    {
        path: '/testimonial',
        name: 'Testimonial',
        component: Testimonial,
        meta:{
            requiresAuth: false
        }
    },
    {
        path: '/about',
        name: 'About',
        component: About,
        meta:{
            requiresAuth: false
        }
    },
    //notFound
    {
        path: '/:pathMatch(.*)*)',
        name: 'notFound',
        component: notFound,
        meta:{
            requiresAuth: false
        }
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
