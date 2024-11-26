<template>
    <div>
        <home_banner_section/>

        <feature_area_section/>

        <explore_categories_section :categories="categories"/>

        <popular_courses :popular-courses="popularCourses"/>

        <new_courses_section :new-courses="newCourses"/>

        <gap_registration_area/>

        <trainer_area_section/>

        <event_area_section/>

        <testimonial_area_section/>

        <payment_img_section/>
    </div>

</template>

<script>

    import Home_banner_section from "../components/sections/home_banner_section";
    import Feature_area_section from "../components/sections/feature_area_section";
    import Popular_courses from "../components/sections/popular_courses";
    import New_courses_section from "../components/sections/new_courses_section";
    import Gap_registration_area from "../components/sections/gap_registration_area";
    import Trainer_area_section from "../components/sections/trainer_area_section";
    import Event_area_section from "../components/sections/events_area_section";
    import Testimonial_area_section from "../components/sections/testimonial_area_section";
    import Payment_img_section from "../components/sections/payment_img_section";
    import Explore_categories_section from "../components/sections/explore_categories_section";

    export default {
        name: "homeComponent",
        components: {
            Explore_categories_section,
            Payment_img_section,
            Testimonial_area_section,
            Event_area_section,
            Trainer_area_section,
            Gap_registration_area,
            Popular_courses,
            New_courses_section,
            Feature_area_section,
            Home_banner_section
        },
        data() {
            return {
                popularCourses: [],
                newCourses: [],
                categories: [],
            };
        },
        mounted() {
            const _this = this;
            this.fetchData(this.urlGenerate(), (result) => {
                _this.popularCourses = result['popular_courses'];
                _this.newCourses = result['new_courses'];
                _this.categories = result['categories'];
            });
        }

    }
</script>

<style scoped>

</style>








