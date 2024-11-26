
<template>
    <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
        <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
            <a class="navbar-brand brand-logo-mini align-self-center d-lg-none" href="index.html">
                <img :src="asset('backend/assets/images/logo-backend-mini.png')" width="50px" alt="logo" />
            </a>
            <button class="navbar-toggler navbar-toggler align-self-center mr-2" type="button" data-toggle="minimize">
                <i class="mdi mdi-menu"></i>
            </button>
            <ul class="navbar-nav">
                <!-- Notification and Message Dropdowns (your existing code) -->
            </ul>
            <ul class="navbar-nav navbar-nav-right ml-lg-auto">
                <li class="nav-item dropdown d-none d-xl-flex border-0">
                    <a class="nav-link dropdown-toggle" id="languageDropdown" href="#" data-toggle="dropdown">
                        <i class="mdi mdi-earth"></i> English
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="languageDropdown">
                        <a class="dropdown-item" href="#">
                            <img src="https://cdn.ostad.app/public/upload/2023-08-06T04-12-22.324Z-imageE66.png" style="width: 19px; min-width: 19px; height: 19px; min-height: 19px;" alt="English">
                            English
                        </a>
                        <a class="dropdown-item" href="#">
                            <img src="https://cdn.ostad.app/public/upload/2023-08-06T04-12-39.378Z-imageB64.png" style="width: 19px; min-width: 19px; height: 19px; min-height: 19px;" alt="Bangla">
                            Bangla
                        </a>
                    </div>
                </li>

                <li class="nav-item nav-profile dropdown border-0">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown">
                        <img class="nav-profile-img mr-2 bg-white" alt="" :src="generateFileUrl(auth ? auth.avatar : null, TYPE_USER)" />
                        <span class="profile-name">{{ auth ? auth.name : 'No User' }}</span> <!-- Display the user's name -->
                    </a>
                    <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="#" @click.prevent="confirmLogout">
                            <i class="mdi mdi-logout mr-2 text-primary"></i> Logout
                        </a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
</template>

<script>
    import axios from 'axios';
    import Swal from 'sweetalert2';

    export default {
        name: 'topNavBar',
        data() {
            return {
                //
            };
        },
        methods: {
            confirmLogout() {
                const _this = this;
                this.showSweetAlert({
                    text: "Do you really want to log out?",
                    confirmButtonText: 'Yes, log me out!',
                    cancelButtonText: 'Cancel',
                    callback: (conform) => {
                        if (conform) _this.logout();
                    }
                });
            },
            async logout() {
                try {
                    await axios.post('/logout'); // Call the logout endpoint
                    window.location.href = '/login'; // Redirect to the login page
                } catch (error) {
                    console.error('Logout failed:', error);
                }
            }
        }
    };
</script>

<style scoped>
    /* Add your styles here */
</style>
