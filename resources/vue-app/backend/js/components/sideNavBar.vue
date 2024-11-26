
<template>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="text-center sidebar-brand-wrapper d-flex align-items-center" title="Visit website">
            <a class="sidebar-brand brand-logo" :href="baseUrl">
                <img :src="asset('backend/assets/images/logo-backend.png')" alt="logo" />
            </a>
            <a class="sidebar-brand brand-logo-mini pl-4 pt-3" :href="baseUrl">
                <img :src="asset('backend/assets/images/logo-backend-mini.png')" alt="logo" />
            </a>
        </div>

        <ul class="nav">
            <!-- Profile Section -->
            <li class="nav-item nav-profile">
                <router-link :to="{name: 'user-profile'}" class="nav-link">
                    <div class="nav-profile-image">
                        <img :src="generateFileUrl(auth ? auth.avatar : null, TYPE_USER)" class="nav-profile-img" alt="profile" />
                        <span class="login-status online"></span>
                    </div>
                    <div class="nav-profile-text d-flex flex-column pr-3">
                        <span class="font-weight-medium mb-2">{{ auth ? auth.name : 'No User' }}</span>
                        <span class="font-weight-normal">{{ auth && auth.role ? auth.role.name : 'NA' }}</span>
                    </div>
                    <span class="badge badge-danger text-white ml-3 rounded">3</span>
                </router-link>
            </li>

            <!-- Modules -->
            <li v-for="module in Config.modules" class="nav-item">
                <template v-if="module.sub_modules && module.sub_modules.length > 0">
                    <a class="nav-link" data-toggle="collapse" :href="'#module-collapse-'+module.id" aria-expanded="false" :aria-controls="'module-collapse-'+module.id">
                        <i :class="module.icon + ' menu-icon'"></i>
                        <span class="menu-title">{{ module.name }}</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" :id="'module-collapse-'+module.id">
                        <ul class="nav flex-column sub-menu">
                            <li v-for="subModule in module.sub_modules" class="nav-item">
                                <router-link class="nav-link" :to="subModule.link">{{ subModule.name }}</router-link>
                            </li>
                        </ul>
                    </div>
                </template>
                <router-link v-else class="nav-link" :to="module.link">
                    <i :class="module.icon + ' menu-icon'"></i>
                    <span class="menu-title">{{ module.name }}</span>
                </router-link>
            </li>
        </ul>
    </nav>
</template>

<script>
    export default {
        name: 'Sidebar',
    };
</script>

<style scoped>

</style>
