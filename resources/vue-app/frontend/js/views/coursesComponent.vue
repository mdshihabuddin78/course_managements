<template>
    <div>
        <template>
            <div class="popular_courses section_gap_top">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="main_title mb-4">
                                <h2 class="mb-3">Our Courses</h2>
                                <p>Replenish man have thing gathering lights yielding shall you</p>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 d-sm-flex">
                        <div class="d-flex align-items-center primary-bg2 text-white py-2 px-3" :style="{ borderRadius: '10px 0px 0px 10px' }">
                            Categories
                        </div>
                        <div class="my-auto tag-btn-area">
                            <a @click.prevent="selectCategories(0)" href="#"  :class="`genric-btn circle small ${selectedCats.length === 0 ? 'primary' : 'primary-border'}`">All</a>
                            <template  v-for="category in categories">
                                <a @click.prevent="selectCategories(category.id)" href="#" :key="category.id" :class="`genric-btn circle small ${selectedCats.includes(category.id) ? 'primary' : 'primary-border'}`">{{ category.title }}</a>
                            </template>
                        </div>
                    </div>
                    <courses-component-util :courses="courses" />

                    <!-- Loading Indicator -->
                    <div v-if="scroll" ref="loading"></div>
                </div>
            </div>
        </template>



        <gap_registration_area />



       <feature_area_section />


    </div>


</template>


<script>
    import Popular_courses from "../components/sections/popular_courses";
    import Feature_area_section from "../components/sections/feature_area_section";
    import Gap_registration_area from "../components/sections/gap_registration_area";
    import Banner_area from "../components/sections/banner_area";
    import CoursesComponentUtil from "../components/coursesComponentUtil";

    export default {
        name: "coursesComponent",
        components: {CoursesComponentUtil, Banner_area, Gap_registration_area, Feature_area_section, Popular_courses},
        data() {
            return {
                courses: [],
                categories: [],
                selectedCats: [],
                scroll: true,
                page: 1,
            };
        },
        mounted() {
            const paramCatId = this.$route.params.cat_id;
            if (paramCatId) this.selectedCats.push(paramCatId);

            this.fetchCourses(1);

            this.setupObserver();

            const _this = this;
            this.fetchData(this.urlGenerate('api/required-data', false, {categories: true}), (result) => {
                _this.categories = result.categories;
            })
        },
        watch: {
            selectedCats() {
                // Fetch new courses when selected categories change
                this.fetchCourses(1);
            }
        },
        methods: {
            fetchCourses(page) {
                const _this = this;
                this.httpReq({
                    url: this.urlGenerate(false, false, {page: page}),
                    method: 'post',
                    data: {categories_id: this.selectedCats},
                    callback: (response) => {
                        const result = response.data ? response.data.result : null;
                        if (!result || _this.isEmptyData(result.data)) {
                            _this.scroll = false;
                            return;
                        }

                        if (page === 1) _this.courses = [];
                        _this.courses.push(...result.data);
                        _this.page = result.current_page;
                    }
                })
            },
            setupObserver() {
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            this.fetchCourses(++this.page); // Fetch more courses when visible
                        }
                    });
                });

                observer.observe(this.$refs.loading); // Observe the loading element
            },
            selectCategories(id) {
                // If id is 0 (All categories), reset the selectedCats
                if (id === 0) {
                    this.selectedCats = []; // Only 'All' selected
                    return;
                }
                // Add/remove category ID to/from selectedCats
                if (this.selectedCats.includes(id)) this.removeArrItem(this.selectedCats, id);
                else this.selectedCats.push(id);
            }
        }
    }
</script>

<style scoped>
    .tag-btn-area a {
        margin: 2px;
    }
</style>