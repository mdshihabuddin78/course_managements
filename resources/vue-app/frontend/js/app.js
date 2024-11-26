import Vue from 'vue'
import VueRouter from 'vue-router'

import Toast from 'vue-toastification';
import 'vue-toastification/dist/index.css';
Vue.use(Toast);

import commonMixin from "../../utils/mixins/commonMixin";
import httpMixin from "../../utils/mixins/httpMixin";

Vue.use(VueRouter);
import App from './App.vue'
import route from './routes'

import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueAxios, axios);


// import {store as storeData} from './store';
//
// const store = new Vuex.Store(storeData);


import {store as storeData} from "../../utils/store";
import Vuex from "vuex";
Vue.use(Vuex);
const store = new Vuex.Store(storeData);

const router = new VueRouter({
    mode : 'history',
    routes : route,
    linkActiveClass : 'active'
});


Vue.mixin(commonMixin);
Vue.mixin(httpMixin);

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
Vue.use(VueSweetalert2);

const vue = new Vue({
    el : '#app',
    components : {App},
    router, store,axios
});