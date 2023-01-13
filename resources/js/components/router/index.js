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
        component: AdminDashboard,
    },
    {
        path: '/admin/dashboard',
        name: 'AdminDashboard',
        component: AdminDashboard,
    },
    //pages
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: '/shop',
        name: 'Shop',
        component: Shop,
    },
    {
        path: '/blogs',
        name: 'Blogs',
        component: Blogs,
    },
    {
        path: '/contact',
        name: 'Contact',
        component: Contact,
    },
    {
        path: '/testimonial',
        name: 'Testimonial',
        component: Testimonial,
    },
    {
        path: '/about',
        name: 'About',
        component: About,
    },
    //notFound
    {
        path: '/:pathMatch(.*)*)',
        name: 'notFound',
        component: notFound,
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router;
