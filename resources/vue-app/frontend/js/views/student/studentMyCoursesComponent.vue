<template>
    <div class="container mt-5">
        <courses-component-util :courses="myCourse"/>
    </div>
</template>

<script>
    import CoursesComponentUtil from "../../components/coursesComponentUtil";
    export default {
        name: "studentMyCoursesComponent",
        components: {CoursesComponentUtil},
        data(){
            return{
                myCourse:[],
            }
        },
        mounted() {
            const _this = this;
            this.fetchData(false, (result) => {
                _this.myCourse = result.purchased_course;
            });
        },
    }
</script>

<style scoped>

</style>