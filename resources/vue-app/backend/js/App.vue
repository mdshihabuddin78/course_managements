<template>
    <div class="container-scroller">
        <side-nav-bar></side-nav-bar>
        <top-nav-bar></top-nav-bar>
        <div v-if="isAppReady" class="main-panel">
            <router-view></router-view>
            <Footer></Footer>
        </div>
    </div>
</template>

<script>
    import SideNavBar from "./components/sideNavBar";
    import TopNavBar from "./components/topNavBar";
    import Footer from "./components/Footer";

    export default {
        name: 'App',
        components: {
            Footer,
            TopNavBar,
            SideNavBar
        },

        data() {
            return {
                isAppReady: false,  // Flag to check if app is ready
            };
        },
        mounted() {
            const _this = this;
            this.fetchData(this.urlGenerate('api/configurations'), (result) => {
                _this.$store.commit('setConfig', result);
                _this.$store.commit('setAuth', result.auth);
                _this.$store.commit('setSettings', result.settings);
                _this.isAppReady = true;
            });
        }
    }
</script>

<style scoped>

</style>
