<template>
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <router-link class="navbar-brand" to="/">
                    <img width="250" src="public/web/images/logo.png" alt="#" />
                </router-link>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <router-link class="nav-link" to="/">Home <span class="sr-only">(current)</span></router-link>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                <span class="nav-label">Pages </span><span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><router-link to="/about">About</router-link></li>
                                <li><router-link to="/testimonial">Testimonial</router-link></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/shop">Shop</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/blogs">Blog</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link class="nav-link" to="/contact">Contact</router-link>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fa fa-heart"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fa fa-user"></i> Login
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
</template>
