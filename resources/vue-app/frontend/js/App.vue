<template>
    <div v-if="isAppReady">
        <header-menu v-if="showHeader === 1"></header-menu>

        <router-view></router-view>

        <!--    1 => regular, 2 => mini    -->
        <my-footer v-if="showFooter === UI_FOOTER_REGULAR"></my-footer>
        <my-footer-mini v-if="showFooter === UI_FOOTER_MINI"></my-footer-mini>
    </div>


</template>
<script >
 import HeaderMenu from "./components/headerMenu";
 import MyFooter from "./components/myFooter";
 import HomeComponent from "./views/homeComponent";
 import MyFooterMini from "./components/myFooterMini";
 export default {
     components: {MyFooterMini, HomeComponent, MyFooter, HeaderMenu},

     data() {
         return {
             isAppReady: false,  // Flag to check if app is ready
         };
     },
     mounted() {
         const _this = this;
         this.fetchData(this.urlGenerate('api/required-data', false, {auth: true}), (result) => {
             _this.$store.commit('setAuth', result.auth);
             _this.isAppReady = true;
         })
     }
 }
</script>
<style scoped>

</style>

