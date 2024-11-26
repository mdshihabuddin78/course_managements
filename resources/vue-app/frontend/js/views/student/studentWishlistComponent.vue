<template>
    <div class="container mt-5">
        <courses-component-util :courses="wishList" :show-close-btn="true" @remove-course="removeFromWishlist"/>
    </div>
</template>

<script>
    import CoursesComponentUtil from "../../components/coursesComponentUtil";

    export default {
        name: "studentWishlistComponent",
        components: { CoursesComponentUtil },
        data() {
            return {
                wishList: [], // Store the wishlist courses
            };
        },
        mounted() {
            this.fetchData(false, (result) => {
                this.wishList = result.liked_course;
            });
        },
        methods: {
            removeFromWishlist(courseId) {
                const _this = this;
                this.showSweetAlert({
                    callback: (confirm) => {
                        if (confirm) {
                            _this.httpReq({
                                customUrl: 'api/courses/do-like',
                                method: 'post',
                                data: {course_id: courseId},
                                callback: () => {
                                    _this.removeObjArrItem(_this.wishList, {id: courseId});
                                }
                            })
                        }
                    }
                });
            },
        }
    };
</script>