<template>
    <div class="row">
        <div v-for="course in courses" :key="course.id" class="col-lg-3 col-md-4 mb-4">
            <div class="single_course card h-80 w-100">
                <div class="course_head position-relative">
                    <img class="img-fluid rounded-top" :src="generateFileUrl(course.thumbnail)" alt="" style="object-fit: cover; height: 150px; width: 100%;">

                    <!-- Wishlist Remove Button -->
                    <button v-if="showCloseBtn"   @click="$emit('remove-course', course.id)"  class="wishlist-remove btn btn-danger btn-sm position-absolute">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

                <div class="course_content card-body">
                    <!-- Category Tag -->
                    <div style="padding-right: 15px">
                        <span v-if="course.created_ago" class="tag mb-3 d-inline-block text-sm badge primary-bg3 p-1" style="font-size: 10px; text-transform: none;">{{ course.created_ago }}</span>
                        <span class="tag mb-3 d-inline-block text-sm badge badge-secondary p-1" style="font-size: 10px">{{course.category ? course.category.title : ''}}</span>
                    </div>

                    <!-- Course Title -->
                    <h4 class="mb-3">
                        <router-link to="/courses" class="text-dark" style="font-size: 17px; text-overflow: ellipsis;">{{ limitText(course.title, 23) }}</router-link>
                    </h4>

                    <!-- Course Details (Duration and Students) -->
                    <div class="mb-2 d-flex align-items-center justify-content-between">
                        <span class="text-black">
                            <i class="fas fa-clock primary-text3 mr-1"></i> {{ formatDaysToDuration(course.duration) }}
                        </span>
                        <span class="text-black">
                            <i class="fas fa-user-graduate primary-text3 mr-1"></i> {{ course.students_count ? course.students_count : 0}}/{{ course.sits }}
                        </span>
                    </div>

                    <!-- Horizontal line -->
                    <hr class="my-2">

                    <!-- Review Section with 5 Stars -->
                    <div class="review-section d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-star primary-text"></i>
                            <span>{{ course.reviews_avg_rating ? Number(course.reviews_avg_rating).toFixed(1) : 'NA' }}</span>
                        </div>

                        <span class="font-weight-bold ml-2" style="padding-left: 10px;">
                        {{ isFree(course) ? 'Free' : course.price+'tk' }}
                        </span>
                    </div>

                    <!-- See Details Button at the top -->
                    <div class="mt-4">
                        <router-link :to="{ name: 'courseDetails', params: { id: course.id } }" class="btn btn-block btn-lg see-details-button d-flex justify-content-center align-items-center">
                            SEE DETAILS
                            <i class="fas fa-arrow-right ml-2"></i>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "coursesComponentUtil",
        props: {
            courses: {
                type: Array,
                required: true
            },
            showCloseBtn: {
                type: Boolean,
                default: false
            }
        },
        methods: {
            confirmRemove(courseId) {
                this.$emit('remove-course', courseId);
            }
        }
    }
</script>

<style scoped>
    .course_head img {
        object-fit: cover;
        width: 100%;
    }

    .see-details-button {
        background-color: white;
        color: #002347;
        font-size: 1rem;
        padding: 10px;
        border-radius: 4px;
        border: 2px solid #002347;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .see-details-button:hover {
        background-color: #002347;
        color: white;
    }

    .single_course {
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        height: 100%;
    }

    .single_course:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    }

    .wishlist-remove {
        top: 8px;
        right: 8px;
        padding: 5px;
        background-color: white;
        border: none;
        border-radius: 100%;
        color: black;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
    }

    .wishlist-remove i {
        font-size: 16px;
    }

    .review-section {
        font-size: 14px;
        color: #6c757d;
    }

    .review-section i {
        margin-right: 4px;
    }

    hr {
        border-top: 1px solid #ddd;
    }
</style>