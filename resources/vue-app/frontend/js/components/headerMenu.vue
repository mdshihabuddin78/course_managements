
<template>
    <div>
        <!--================ Start Header Menu Area =================-->
        <header class="header_area yellow-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container" style="background: rgba(255,255,255,0.68);">
                        <router-link class="navbar-brand logo_h" to="/">
                            <img :src="asset('frontend/img/logo.png')" alt="Logo" width="150px" />
                        </router-link>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item">
                                    <router-link class="nav-link" to="/">Home</router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" to="/about">About</router-link>
                                </li>
                                <li class="nav-item submenu dropdown">
                                    <router-link class="nav-link" to="/courses">Courses</router-link>
                                </li>
                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Blog</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item">
                                            <router-link class="nav-link" to="/blog">Blog</router-link>
                                        </li>
                                        <li class="nav-item">
                                            <router-link class="nav-link" to="/blogDetails">Blog Details</router-link>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" to="/contact">Contact</router-link>
                                </li>
                                <!-- Include the search component here-->
                                <li class="nav-item search-container">
                                    <search-component />
                                </li>
                            </ul>
                            <ul class="mb-0">
                                <li v-if="!isEmptyData(auth)" class="nav-item nav-profile dropdown border-0">
                                    <a class="dropdown-toggle primary-text2" id="profileDropdown" href="#" data-toggle="dropdown">
                                        <img class="nav-profile-img" alt="" :src="generateFileUrl(auth ? auth.avatar : null, TYPE_USER)" />
                                        <span class="profile-name primary-text2">{{ userName }}</span>
                                    </a>
                                    <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                                        <router-link v-if="auth.role_id === 4" :to="{name: 'student-profile'}" class="dropdown-item primary-text2">
                                            <i class="fa fa-user mr-2"></i> Profile
                                        </router-link>
                                        <a v-else :href="urlGenerate('admin/user/profile')" target="blank" class="dropdown-item primary-text2">
                                            <i class="fa fa-user mr-2"></i> Profile
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="#" @click.prevent="confirmLogout">
                                            <i class="fas fa-sign-out-alt mr-2"></i> Logout
                                        </a>
                                    </div>

                                </li>
                                <a v-else class="primary-btn mb-0" href="/login">Log In</a>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!--================ End Header Menu Area =================-->
    </div>
</template>

<script>
    import axios from 'axios';
    import Swal from 'sweetalert2';
    import SearchComponent from './searchComponent.vue'; // Import the search component

    export default {
        name: 'HeaderMenu',
        components: {
            SearchComponent // Register the component
        },
        data() {
            return {
                //
            };
        },
        computed: {
            userName() {
                const user = this.auth;
                return user ? user.name : 'Guest';
            }
        },
        methods: {
            goToProfile() {
                // Navigate to the profile page or handle the profile action
                this.$router.push('/profile'); // Assuming you have a route for profile
            },
            confirmLogout() {
                const _this = this;
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you really want to log out?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#f44a40',
                    cancelButtonColor: '#4cd3e3',
                    confirmButtonText: 'Yes, log out!',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        _this.httpReq({
                            customUrl: 'logout',
                            method: 'post',
                            callback: (response) => {
                                _this.$store.commit('setAuth', {});
                                window.location.href = this.urlGenerate('login');
                            }
                        })
                    }
                });
            },
        }
    };
</script>

<style scoped>
    .nav-profile-img {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        border: 2px solid #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        object-fit: cover;
    }

    .profile-name {
        font-weight: bold;
        color: #333;
    }

    .search-container {

    }

    .dropdown-menu {
        border-radius: 0.5rem;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        transition: all 0.2s ease;
    }

    .dropdown-item {
        display: flex;
        align-items: center;
        padding: 0 10px;
        color: #333;
        font-size: 14px;
        font-weight: 500;
    }

    .dropdown-item:hover {
        background-color: #f8f9fa;
        color: #007bff;
    }

    /* Divider style */
    .dropdown-divider {
        height: 1px;
        background-color: #e9ecef;
    }

</style>
