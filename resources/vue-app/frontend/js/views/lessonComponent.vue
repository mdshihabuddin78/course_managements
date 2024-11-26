<template>
    <div>
        <!--================ Start Course Details Area =================-->
        <section class="course_details_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 course_details_left" v-if="lesson">
                        <div class="main_image w-100" style="overflow: hidden;">
                            <img v-if="isEmptyData(lesson.video)" class="img-fluid" :src="generateFileUrl(lesson.thumbnail, TYPE_LESSON)" alt="">
                            <video v-else ref="lessonVideo" class="rounded w-100" controls>
                                <source :src="generateFileUrl(lesson.video, TYPE_LESSON_VIDEO)" type="video/mp4">
                                <source :src="generateFileUrl(lesson.video, TYPE_LESSON_VIDEO)" type="video/webm">
                                <source :src="generateFileUrl(lesson.video, TYPE_LESSON_VIDEO)" type="video/ogg">
                                Your browser does not support the video tag.
                            </video>
                        </div>
                        <div class="content_wrapper">
                            <div class="title d-flex justify-content-between align-items-center">
                                <div>
                                    <h3>{{ lesson.title }}</h3>
                                    <router-link v-if="!isEmptyData(lesson.course)" :to="`/courses/${lesson.course.id}`">
                                        <h6 class="mb-0"><strong>Course: </strong>{{ lesson.course.title }}</h6>
                                    </router-link>
                                </div>
                                <div>
                                    <span class="meta_info mr-3">
                                        <a @click="doLike()" class="primary-text2"> <!-- Call doLike without parameters -->
                                            <i :class="`pointer ${likes.includes(auth.id) ? 'fas' : 'far'} fa-thumbs-up`"></i>
                                            {{ likes.length }}
                                        </a>
                                    </span>
                                    <span class="meta_info">
                                       <a href="#review-area" class="primary-text2"> <i class="far fa-comment"></i> {{ reviews.length }} </a>
                                    </span>
                                </div>
                            </div>
                            <div class="content">
                                {{ lesson.description }}
                                <br>
                                <br>
                            </div>

                            <h4 class="title">Comments</h4>
                            <div class="reviews-list">
                                <h6 class="mb-3">Recent Comments</h6>
                                <div v-for="review in reviews" :key="review.id" class="review-item mb-3">
                                    <div class="user-info d-flex align-items-start justify-content-between">
                                        <div class="user-thumb mr-3">
                                            <img :src="generateFileUrl(auth.avatar, TYPE_USER)" alt="User Avatar" />
                                        </div>
                                        <div class="user-details flex-grow-1">
                                            <h6 class="mb-1">{{ review.user ? review.user.name : ''}}</h6>
                                            <!-- Display the comment or the textarea for editing -->
                                            <div v-if="isUpdating(review)">
                                                <textarea v-model="review.comment" class="form-control" rows="4" placeholder="Update your review..."></textarea>
                                            </div>
                                            <div v-else>
                                                <p class="comment mb-2">{{ review.comment }}</p>
                                            </div>

                                            <div class="review-footer mt-2 d-flex justify-content-between">
                                                <div>
                                                    <a @click="doLike(TYPE_LIKE_REVIEW, review.id)" class="mr-3 primary-text2">
                                                        <i :class="`pointer ${reviewsLikes[review.id].includes(auth.id) ? 'fas' : 'far' } fa-thumbs-up`"></i> {{reviewsLikes[review.id].length}}
                                                    </a>
                                                    <a class="mr-3 primary-text2">
                                                        <i class="pointer fas fa-reply"></i>
                                                    </a>
                                                    <a v-if="review.user.id === auth.id" class="primary-text2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="pointer fas fa-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                        <a @click="handleDropDown('edit', review)" class="dropdown-item pointer">Edit</a>
                                                        <a @click="handleDropDown('delete', review)" class="dropdown-item pointer">Delete</a>
                                                        <a @click="handleDropDown('hide', review)" class="dropdown-item pointer">Hide</a>
                                                    </div>
                                                </div>
                                                <div v-if="isUpdating(review)">
                                                    <button @click="cancelUpdate" class="genric-btn danger circle">Cancel</button>
                                                    <button @click="submitReview" class="genric-btn info circle arrow">Update<span class="ti-arrow-right"></span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="review-area">
                                <!-- If the user is logged in and has not already reviewed the course -->
                                <div>
                                    <div class="feedback mb-4">
                                        <div class="d-flex justify-content-between">
                                            <h4>Give your opinion</h4>
                                        </div>
                                        <div>
                                            <textarea v-model="form.comment" class="form-control" rows="4" placeholder="Share your experience..."></textarea>
                                            <div class="text-right mt-3">
                                                <button @click="submitReview()" class="genric-btn primary-bg2 text-white circle arrow">Submit<span class="ti-arrow-right"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 right-contents" v-if="lesson && lesson.course">
                        <lessons-playlist-component v-if="lesson.course" :id="lesson.id" :lessons="lesson.course.lessons" :running-info="runningInfo"/>

                        <h4 v-if="isEmptyData(lesson.quizzes)" class="mt-5 text-center">No quizzes available for this Lesson</h4>
                        <h4 v-else-if="false" class="mt-5 text-center">The {{ lesson.quizzes.length }} quizzes will appear soon</h4>
                        <quizzes-playlist-component v-else id="quiz_area" :quizzes="lesson.quizzes" :running-info="runningInfo"/>

                        <div class="mt-5 d-flex justify-content-between">
                            <div>
                                <router-link :to="{ name: 'lesson', params: { id: prev.id } }" v-if="showPrevNextBtn(prev)" class="genric-btn primary2 circle arrow px-3"><span class="ml-0 mr-2 ti-arrow-left"></span>Prev</router-link>
                            </div>
                            <div>
                                <button @click="goNextLesson()"  v-if="showPrevNextBtn(next)" class="genric-btn primary2 circle arrow px-3">Next<span class="ti-arrow-right"></span></button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!--================ End Course Details Area =================-->
    </div>
</template>

<script>
    import QuizModalComponent from "../components/quizModalComponent";
    import LessonsPlaylistComponent from "../components/lessonsPlaylistComponent";
    import QuizzesPlaylistComponent from "../components/quizzesPlaylistComponent";
    export default {
        name: "lessonDetails",
        components: {QuizzesPlaylistComponent, LessonsPlaylistComponent, QuizModalComponent},
        props: ['lessonId'],
        data() {
            return {
                lesson: {},
                runningInfo : {},
                prev: {},
                next: {},
                reviews: [],
                likes: [],
                reviewsLikes: {},
                form: {
                    comment: '',
                },
                TYPE_LIKE_LESSON: 11,
                TYPE_LIKE_REVIEW: 12,

            };
        },
        watch: {
            // Watch for changes in lesson_id
            lesson_id(newId, oldId) {
                if (newId !== oldId) {
                    this.fetchLesson(newId);
                }
            }
        },
        mounted() {
            this.fetchLesson(this.lesson_id);
        },
        destroyed() {
            // check for is complete this lesson, if yes then update
            if (this.isCompleteAllQuizzes(this.lesson.quizzes)) {
                if (!this.isEmptyData(this.runningInfo.completed_lessons_id))
                    this.runningInfo.completed_lessons_id.push(this.runningInfo.lesson_id);
                this.httpReq({
                    customUrl: 'api/lessons/running-infos',
                    urlSuffix: this.runningInfo.id,
                    method: 'put',
                    data: {status: 1}, // 1 == completed
                });
            }
        },
        computed: {
            lesson_id() {
                return this.$route.params.id;
            },
        },
        methods: {
            fetchLesson(id) {
                const _this = this;
                this.fetchData(this.urlGenerate(false, id), (result) => {
                    _this.lesson = result['lesson'];
                    _this.runningInfo = result['running_info'];
                    _this.prev = result['prev'];
                    _this.next = result['next'];
                    _this.reviews = result['reviews'];
                    _this.likes = result['likes'];
                    _this.reviewsLikes = result['reviews-likes'];
                    _this.form.user_id =  _this.auth.id;
                    _this.form.lesson_id = _this.lesson ? _this.lesson.id : null;

                    const videoElement = this.$refs.lessonVideo;
                    if (videoElement) videoElement.load(); // Load the new video
                });
            },
            handleDropDown(action, review) {
                this.$nextTick(() => {
                    $('#dropdownMenuButton').dropdown('toggle');
                });
                if (action === 'edit') this.form = review;
                if (action === 'delete') this.deleteReview(review.id);

            },
            submitReview() {
                if (!this.form.comment.trim()) {
                    alert('Please enter your comment before submitting.');
                    return;
                }

                const _this = this;
                this.httpReq({
                    customUrl: this.form.id ? 'api/reviews' : 'api/review/lesson-reviews',
                    method: this.form.id ? 'put' : 'post',
                    urlSuffix: this.form.id ?? false,
                    data: _this.form,
                    callback(response) {
                        if (response.data) {
                            const newReview = response.data.result;

                            if (!_this.form.id) {
                                newReview.user = _this.auth;
                                _this.reviewsLikes[newReview.id] = [];
                                _this.reviews.push(newReview);
                                _this.hasReviewed = true;
                            }
                            _this.form = {
                                comment: '',
                            };
                            _this.fetchLesson(_this.lesson_id);
                        } else {
                            alert('Failed to submit the review. Please try again.');
                        }
                    },
                });
            },

            deleteReview(id) {
                this.httpReq({
                    customUrl: 'api/reviews',
                    urlSuffix: id,
                    method: 'delete',
                    callback: (response) => {
                        if (response.data) {
                            this.reviews = this.reviews.filter(review => review.id !== id);
                            this.hasReviewed = false;
                        }
                    }
                });
            },


            showPrevNextBtn(less) {
                const lessons = this.lesson && this.lesson.course ? this.lesson.course.lessons : [];
                // Base cases: Check if lessons array and currentLessonId are valid
                if (this.isEmptyData(less) || this.isEmptyData(lessons)) return false;
                const currentIndex = lessons.findIndex(lesson => lesson.id === less.id);
                return currentIndex !== -1;

            },

            cancelUpdate() {
                this.form = {
                    rating: 0,
                    comment: '',
                };
            },

            isUpdating(review) {
                return this.form && this.form.id === review.id;
            },

            doLike(type = this.TYPE_LIKE_LESSON, id = this.lesson.id) {
                if (this.isEmptyData(this.auth)) return;

                let customUrl = 'api/lessons/do-like';
                let likesArr = this.likes;
                let data = {lesson_id: id,};

                if (type === this.TYPE_LIKE_REVIEW) {
                    customUrl = 'api/reviews/do-like';
                    likesArr = this.reviewsLikes[id];
                    data = {review_id: id}
                }

                const _this = this;
                this.httpReq({
                    customUrl,
                    method: 'post',
                    data,
                    callback(response) {
                        if (response.data.result === 1)
                            likesArr.push(_this.auth.id);
                        else if(response.data.result === 0)
                            _this.removeArrItem(likesArr, _this.auth.id);
                        else
                            _this.showToast('Failed to like the course. Please try again.', 'error')
                    }
                });
            },

            goNextLesson() {
                if (this.isEmptyData(this.runningInfo)) return;

                if (!this.isCompleteAllQuizzes(this.lesson ? this.lesson.quizzes : null)) {
                    this.showSweetAlert({
                        title: 'Complete The Quizzes First!',
                        text: 'You have to complete all quizzes to unlock the next lesson.',
                        icon: 'error',
                        showCancelButton: false,
                        confirmButtonText: 'Got It',
                        confirmButtonColor: '#002347'
                    });
                    return;
                }

                const _this = this;
                this.httpReq({
                    customUrl: 'api/courses/running-infos',
                    urlSuffix: this.runningInfo.ric_id,
                    method: 'put',
                    data: {current_lesson_id: this.next.id},
                    callback: () => {
                        _this.$router.push({name: 'lesson', params: {id: _this.next.id}});
                    },
                });
            },
        },
    }
</script>

<style scoped>
    .review-item .user-thumb img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .card-body h6 {
        color: #002347;
        font-size: 0.8rem;
    }

    .card-body p {
        color: #777;
        font-size: 0.8rem;
    }

</style>
