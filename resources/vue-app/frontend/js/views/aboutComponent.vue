<template>
    <div>
<!--        <header class="header_area white-header">-->
<!--            <div class="main_menu">-->

<!--                <nav class="navbar navbar-expand-lg navbar-light">-->
<!--                    <div class="container">-->
<!--                        &lt;!&ndash; Brand and toggle get grouped for better mobile display &ndash;&gt;-->
<!--                        <a class="navbar-brand" href="index.html">-->
<!--                            <img class="logo-2" :src="baseUrl + '/frontend/img/logo2.png'" alt="" />-->
<!--                        </a>-->
<!--                        <button-->
<!--                                class="navbar-toggler"-->
<!--                                type="button"-->
<!--                                data-toggle="collapse"-->
<!--                                data-target="#navbarSupportedContent"-->
<!--                                aria-controls="navbarSupportedContent"-->
<!--                                aria-expanded="false"-->
<!--                                aria-label="Toggle navigation"-->
<!--                        >-->
<!--                            <span class="icon-bar"></span> <span class="icon-bar"></span>-->
<!--                            <span class="icon-bar"></span>-->
<!--                        </button>-->
<!--                        &lt;!&ndash; Collect the nav links, forms, and other content for toggling &ndash;&gt;-->
<!--                        <div-->
<!--                                class="collapse navbar-collapse offset"-->
<!--                                id="navbarSupportedContent"-->
<!--                        >-->
<!--                            <ul class="nav navbar-nav menu_nav ml-auto">-->
<!--                                <li class="nav-item">-->
<!--                                    <router-link class="nav-link" to="/">Home</router-link>-->
<!--                                </li>-->
<!--                                <li class="nav-item active">-->
<!--                                    <router-link class="nav-link" to="/about">About</router-link>-->
<!--                                </li>-->
<!--                                <li class="nav-item submenu dropdown">-->
<!--                                    <a-->
<!--                                            href="#"-->
<!--                                            class="nav-link dropdown-toggle"-->
<!--                                            data-toggle="dropdown"-->
<!--                                            role="button"-->
<!--                                            aria-haspopup="true"-->
<!--                                            aria-expanded="false"-->
<!--                                    >Pages</a-->
<!--                                    >-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li class="nav-item">-->
<!--                                            <router-link class="nav-link" to="/courses">Courses</router-link>-->
<!--                                        </li>-->
<!--                                        <li class="nav-item">-->
<!--                                            <router-link class="nav-link" to="/courseDetails">Course Details</router-link>-->
<!--                                        </li>-->
<!--                                        <li class="nav-item">-->
<!--                                            <router-link class="nav-link" to="/elements">Elements</router-link>-->
<!--                                        </li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li class="nav-item submenu dropdown">-->
<!--                                    <a-->
<!--                                            href="#"-->
<!--                                            class="nav-link dropdown-toggle"-->
<!--                                            data-toggle="dropdown"-->
<!--                                            role="button"-->
<!--                                            aria-haspopup="true"-->
<!--                                            aria-expanded="false"-->
<!--                                    >Blog</a-->
<!--                                    >-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li class="nav-item">-->
<!--                                            <router-link class="nav-link" to="/blog">Blog</router-link>-->
<!--                                        </li>-->
<!--                                        <li class="nav-item">-->
<!--                                            <router-link class="nav-link" to="/blogDetails">Blog Details</router-link>-->
<!--                                        </li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li class="nav-item">-->
<!--                                    <router-link class="nav-link" to="/contact">Contact</router-link>-->
<!--                                </li>-->
<!--                                <li class="nav-item">-->
<!--                                    <a href="#" class="nav-link search" id="search">-->
<!--                                        <i class="ti-search"></i>-->
<!--                                    </a>-->
<!--                                </li>-->
<!--                            </ul>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </nav>-->
<!--            </div>-->
<!--        </header>-->
        <!--================ End Header Menu Area =================-->

        <!--================Home Banner Area =================-->
        <banner_area />
        <!--================End Home Banner Area =================-->

        <!--================ Start About Area =================-->
        <section class="about_area section_gap">
            <div class="container">
                <div class="row h_blog_item">
                    <div class="col-lg-6">
                        <div class="h_blog_img">
                            <img class="img-fluid" :src="baseUrl + '/frontend/img/about.png'" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="h_blog_text">
                            <div class="h_blog_text_inner left right">
                                <h4>Welcome to our Institute</h4>
                                <p>
                                    Subdue whales void god which living don't midst lesser
                                    yielding over lights whose. Cattle greater brought sixth fly
                                    den dry good tree isn't seed stars were.
                                </p>
                                <p>
                                    Subdue whales void god which living don't midst lesser yieldi
                                    over lights whose. Cattle greater brought sixth fly den dry
                                    good tree isn't seed stars were the boring.
                                </p>
                                <a class="primary-btn" href="#">
                                    Learn More <i class="ti-arrow-right ml-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ End About Area =================-->

        <!--================ Start Feature Area =================-->
        <section class="feature_area section_gap_top title-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="main_title">
                            <h2 class="mb-3 text-white">Awesome Feature</h2>
                            <p>
                                Replenish man have thing gathering lights yielding shall you
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single_feature">
                            <div class="icon"><span class="flaticon-student"></span></div>
                            <div class="desc">
                                <h4 class="mt-3 mb-2">Scholarship Facility</h4>
                                <p>
                                    One make creepeth, man bearing theira firmament won't great
                                    heaven
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="single_feature">
                            <div class="icon"><span class="flaticon-book"></span></div>
                            <div class="desc">
                                <h4 class="mt-3 mb-2">Sell Online Course</h4>
                                <p>
                                    One make creepeth, man bearing theira firmament won't great
                                    heaven
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="single_feature">
                            <div class="icon"><span class="flaticon-earth"></span></div>
                            <div class="desc">
                                <h4 class="mt-3 mb-2">Global Certification</h4>
                                <p>
                                    One make creepeth, man bearing theira firmament won't great
                                    heaven
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ End Feature Area =================-->


        <testimonial_area_section />
    </div>

</template>

<script>
    import Testimonial_area_section from "../components/sections/testimonial_area_section";
    import Banner_area from "../components/sections/banner_area";
    export default {
        name: "aboutComponent",
        components: {Banner_area, Testimonial_area_section}
    }
</script>

<style scoped>

</style>