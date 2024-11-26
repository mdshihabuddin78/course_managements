<template>
    <footer class="footer-area">
        <div class="container">
            <div class="row footer-bottom d-flex justify-content-between align-items-center py-3">
                <p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
                    Copyright &copy;{{ new Date().getFullYear() }} All rights reserved | Skill-Syntax
                    <i class="ti-heart" aria-hidden="true"></i> by <a href="https://github.com/mad-programmers3/skill-syntax" target="_blank">Mad Programmer</a>
                </p>
                <div class="col-lg-4 col-sm-12 footer-social">
                    <a href="#"><i class="ti-facebook"></i></a>
                    <a href="#"><i class="ti-twitter"></i></a>
                    <a href="#"><i class="ti-dribbble"></i></a>
                    <a href="#"><i class="ti-linkedin"></i></a>
                </div>
            </div>
        </div>
    </footer>
</template>
<script>
    export default {
        name:'myFooterMini'
    }

</script>
<style scoped>

</style>