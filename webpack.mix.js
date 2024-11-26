const path = require("path");

const mix = require('laravel-mix');

mix.alias({
    '@': path.join(__dirname, 'resources/js')
});
// Backend Webpack
mix.js('resources/vue-app/backend/js/app.js', 'public/vue-app/backend/js').vue();
mix.sass('resources/vue-app/backend/css/app.scss', 'public/vue-app/backend/css');

//Frontend Webpack
mix.js('resources/vue-app/frontend/js/app.js', 'public/vue-app/frontend/js').vue();
mix.sass('resources/vue-app/frontend/css/app.scss', 'public/vue-app/frontend/css');