
<template>
    <div class="popular_courses mt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="main_title">
                        <h2 class="mb-3">Our Popular Courses</h2>
                        <p>Replenish man have thing gathering lights yielding shall you</p>
                    </div>
                </div>
            </div>
            <courses-component-util :courses="popularCourses" />
        </div>
    </div>
</template>

<script>
    import CoursesComponentUtil from "../coursesComponentUtil";
    export default {
        name: 'PopularCourses',
        components: {CoursesComponentUtil},
        props: {
            // Define the popularCourses prop, which should be an array
            popularCourses: {
                type: Array,
                required: true
            }
        }
    }
</script>

<style scoped>

</style>























