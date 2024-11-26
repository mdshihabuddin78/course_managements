<template>
        <section class="course_details_area section_gap">
            <div class="container">
                <div v-if="!isEmptyData(course)" class="row">
                    <div class="col-lg-8 course_details_left">
                        <div class="main_image">
                            <!-- Display the course thumbnail or a default image if it's not available -->
                            <img class="img-fluid" :src="course ? generateFileUrl(course.thumbnail, TYPE_COURSE) : asset(DEF_FILES[TYPE_COURSE])" alt="Course Thumbnail" style="padding: 10px;"/>
                        </div>
                        <div class="content_wrapper">
                            <br />
                            <div class="title d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">{{ course ? course.title : '' }}</h4> <!-- Added mb-0 to remove margin from the heading -->
                                <div>
                                    <span class="meta_info mr-3">
                                        <a @click="doLike()" class="primary-text2">
                                            <i :class="`pointer ${likes.includes(auth.id) ? 'fas' : 'far' } fa-heart`"></i> {{likes.length }}
                                        </a>
                                    </span>
                                    <span class="meta_info">
                                       <a href="#review-area" class="primary-text2"> <i class="far fa-comment"></i> {{ reviews.length }} </a>
                                    </span>
                                </div>
                            </div>
                            <h3 >{{ course ? course.title : '' }}</h3>
                            <div class="content">
                                <div v-html="course ? course.description : ''" class="course-description mb-4"></div>
                                <!-- Course Details -->
                                <div class="course-details">
                                    <ul class="list-unstyled">
                                        <li class="mb-3 d-flex justify-content-between align-items-center">
                                            <h5>Price:</h5>
                                            <span class="text-muted">{{ isFree(course) ? 'Free' : course.price+'tk' }}</span>
                                        </li>
                                        <li class="mb-3 d-flex justify-content-between align-items-center">
                                            <h5>Sits:</h5>
                                            <span class="text-muted">{{ course.students_count }}/{{ course.sits}}</span>
                                        </li>
                                        <li class="mb-3 d-flex justify-content-between align-items-center">
                                            <h5>Start Date:</h5>
                                            <span class="text-muted">{{ course.start_date}}</span>
                                        </li>
                                        <li class="mb-3 d-flex justify-content-between align-items-center">
                                            <h5>End Date:</h5>
                                            <span class="text-muted">{{ course.end_date}}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Course Review Section -->
                            <h4 class="title">Reviews ({{ reviews.length }})</h4>
                            <div class="mb-30">
                                <div class="reviews-list">
                                    <h6 class="mb-3">Recent Reviews</h6>
                                    <div v-for="review in reviews" :key="review.id" class="review-item mb-3">
                                        <div class="user-info d-flex align-items-start justify-content-between">
                                            <div class="user-thumb mr-3">
                                                <img :src="generateFileUrl(review.user ? review.user.avatar : null, TYPE_USER)" alt="User Avatar" />
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
                                                    <div v-if="isUpdating(review)" >
                                                        <button @click="cancelUpdate" class="genric-btn danger circle">Cancel</button>
                                                        <button @click="submitReview" class="genric-btn info circle arrow">Update<span class="ti-arrow-right"></span></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div v-if="isUpdating(review)" class="star-rating d-flex mb-2">
                                                <i v-for="rate in 5" :class="'primary-text ' + getStarClass(rate)"
                                                   @mouseover="setHoverRating(rate)"
                                                   @mouseleave="setHoverRating(0)"
                                                   @click="setRating(rate)"
                                                   style="cursor: pointer; font-size: 25px">
                                                </i>
                                            </div>
                                            <div v-else class="star-rating primary-text d-flex mb-2">
                                                <i v-for="rate in 5" :class="['fa', rate <= review.rating ? 'fa-star' : 'fa-star-o']"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Review Area (New review) -->
                            <div id="review-area">
                                <div v-if="isEmptyData(auth)" class="text-center">
                                    <h5>You need to be logged in to provide feedback</h5>
                                    <a class="primary-btn" :href="urlGenerate('login', false, { url: currentUrl + '#review-area' })">Log In</a>
                                </div>
                                <div v-else-if="!auth.purchased_courses_id.includes(course.id)" class="text-center">
                                    <h5>Purchase this course to review it</h5>
                                </div>
                                <!-- If the user is logged in and has not already reviewed the course -->
                                <div v-else-if="!hasReviewed">
                                    <div class="feedback mb-4">
                                        <div class="d-flex justify-content-between">
                                            <h4>Leave Your Review</h4>
                                            <!-- Star Rating for new review -->
                                            <div class="star-rating d-flex mb-2">
                                                <i v-for="rate in 5" :class="'primary-text ' + getStarClass(rate)"
                                                   @mouseover="setHoverRating(rate)"
                                                   @mouseleave="setHoverRating(0)"
                                                   @click="setRating(rate)"
                                                   style="cursor: pointer; font-size: 25px">
                                                </i>
                                            </div>
                                        </div>
                                        <div>
                                            <textarea v-model="form.comment" class="form-control" rows="4" placeholder="Share your experience..."></textarea>
                                            <div class="text-right mt-3">
                                                <button @click="submitReview" class="genric-btn primary2  circle arrow">Submit<span class="ti-arrow-right"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- If the user has already reviewed the course -->
                                <div v-else class="text-center">
                                    <h5>You have already provided feedback for this course.</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Course Lessons And Quizzes Section -->
                    <div v-if="true" class="col-lg-4 right-contents" >
                        <div v-if="isEmptyData(auth)" class="mt-5 row justify-content-center">
                            <div class="col-md-8 text-center">
                                <h4 class="font-weight-bold">
                                    You need to be logged in to continue
                                </h4>
                                <a :href="urlGenerate('login', false, { url: currentUrl})" class="mt-2 genric-btn primary2 circle arrow">Login Now<span class="ti-arrow-right"></span></a>
                            </div>
                        </div>
                        <div v-else-if="!auth.purchased_courses_id.includes(course.id)" class="mt-5 row justify-content-center">
                            <div class="card p-4 shadow-sm mb-4">
                                <form @submit.prevent="purchaseCourse">
                                    <div v-if="!isFree(course)" class="form-group mt-3">
                                        <!-- Bkash Payment Method -->
                                        <div :class="['d-flex align-items-center form-check mb-3', {'primary-border-bold': selectedMethod === 1}]">
                                            <input class="form-check-input d-none" type="radio" id="method-1" :value="1" v-model="selectedMethod" required/>
                                            <label class="form-check-label" for="method-1">
                                                <img width="50px" :src="asset('frontend/img/payment-img/Logo__Bkash.svg')" alt="Bkash" class="payment-logo mr-2" />
                                                Bkash
                                            </label>
                                        </div>

                                        <!-- Nagad Payment Method -->
                                        <div :class="['d-flex align-items-center form-check mb-3', {'primary-border-bold': selectedMethod === 2}]">
                                            <input class="form-check-input d-none" type="radio" id="method-2" :value="2" v-model="selectedMethod" required/>
                                            <label class="form-check-label" for="method-2">
                                                <img width="50px" :src="asset('frontend/img/payment-img/nagad.png')" alt="Nagad" class="payment-logo mr-2" />
                                                Nagad
                                            </label>
                                        </div>
                                    </div>

                                    <!-- Purchase Button -->
                                    <button type="submit" class="mt-2 genric-btn primary2 circle arrow">
                                        Get at {{ isFree(course) ? 'free' : course.price+'tk' }}
                                        <span class="ti-arrow-right"></span>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <template v-else>
                            <!-- Lessons Section -->
                            <h4 v-if="isEmptyData(course.lessons)" class="mt-5 text-center">No lessons available for this course</h4>
                            <lessons-playlist-component v-else :lessons="course.lessons" :running-info="runningInfo"/>

                            <!-- Quizzes Section -->
                            <h4 v-if="isEmptyData(course.quizzes)" class="mt-5 text-center">No quizzes available for this course</h4>
                            <h4 v-else-if="!canShowQuiz()" class="mt-5 text-center">The {{ course.quizzes.length }} quizzes will appear soon</h4>
                            <quizzes-playlist-component v-else :quizzes="course.quizzes" :running-info="runningInfo"/>


                            <!-- Get Certification -->
                            <div v-if="canShowCertificate()" class="mt-5 py-3 px-4 primary-bg2 rounded">
                                <div class="text-center bg-white p-3 rounded">
                                    <h6 class="font-weight-bold">
                                        Congratulations on completing the course! You can now download your certificate.
                                    </h6>
                                    <button @click="downloadCertificate" class="mt-2 genric-btn primary2 circle arrow">Download<span class="fas fa-download"></span></button>
                                </div>
                            </div>
                        </template>

                    </div>
                </div>
            </div>
        </section>
</template>

<script>
    import jsPDF from 'jspdf';
    import QuizModalComponent from "../components/quizModalComponent";
    import LessonsPlaylistComponent from "../components/lessonsPlaylistComponent";
    import QuizzesPlaylistComponent from "../components/quizzesPlaylistComponent";

    export default {
        name: "courseDetails",
        components: {QuizzesPlaylistComponent, LessonsPlaylistComponent, QuizModalComponent},
        props: ['courseId'],
        data() {
            return {
                course: null,
                reviews: [],
                likes: [],
                reviewsLikes: [],
                lessonsLikes: [],
                runningInfo: {},
                form: {
                    rating: 0,
                    comment: '',
                },
                TYPE_LIKE_COURSE: 11,
                TYPE_LIKE_REVIEW: 12,
                TYPE_LIKE_LESSON: 13,
                hoverRating: 0,
                hasReviewed: false,
                selectedMethod: 1,
            };
        },
        mounted() {
            // if (!this.auth) {
            //     this.fetchData(this.urlGenerate('required-data', false, {}));
            // }


            this.fetchCourseData();
            this.checkUserReview();
        },
        methods: {
            // Fetch course and related data
            fetchCourseData() {
                const _this = this;
                this.fetchData(this.urlGenerate(false, this.course_id), (result) => {
                    _this.course = result['course'];
                    _this.reviews = result['reviews'];
                    _this.likes = result['likes'];
                    _this.reviewsLikes = result['reviews_likes'];
                    _this.lessonsLikes = result['lessons_likes'];
                    _this.runningInfo = result['running_info'];

                    _this.form.user_id = _this.auth.id;
                    _this.form.course_id = _this.course ? _this.course.id : null;

                });
            },

            purchaseCourse() {
                if (this.isEmptyData(this.auth) || this.isEmptyData(this.course)) return;
                
                const _this = this;
                this.httpReq({
                    customUrl: 'api/courses/purchase',
                    urlSuffix: this.course.id,
                    method: 'post',
                    callback: (response) => {
                        if (response.data) {
                            _this.runningInfo = response.data.result;
                            _this.showToast(response.data.message);
                            _this.auth.purchased_courses_id.push(_this.course.id);
                            _this.course.students_count++;
                        }
                    }
                });
            },

            canShowQuiz() {
                const lessons = this.course.lessons;
                const crrLessId = this.runningInfo.current_lesson_id;
                if (this.isEmptyData(lessons) && !crrLessId) return false;
                const lastLesson = lessons[lessons.length - 1];
                if (this.isEmptyData(lastLesson)) return false;
                return lastLesson.id === crrLessId;
            },
            canShowCertificate() {
                const currentDate = new Date();
                const endDate = new Date(this.course.end_date);
                if (currentDate < endDate || this.isEmptyData(this.runningInfo) || !this.runningInfo.completed_lessons_id || !this.course.lessons || !this.course.quizzes) return false;

                const allLessonsCompleted = this.runningInfo.completed_lessons_id.length === this.course.lessons.length;
                const allQuizzesCompleted = this.isCompleteAllQuizzes(this.course.quizzes);

                return allLessonsCompleted && allQuizzesCompleted;
            },


            handleDropDown(action, review) {
                // Close the dropdown
                this.$nextTick(() => {
                    $('#dropdownMenuButton').dropdown('toggle'); // Close the dropdown manually
                });

                // Perform your action logic here based on the action type
                if (action === 'edit') this.form = review;
                if (action === 'delete') this.deleteReview(review.id);

            },

            // Check if the user has already reviewed the course
            checkUserReview() {
                const user = this.auth;
                if (!this.isEmptyData(user)) {
                    const userId = user.id;
                    this.hasReviewed = this.reviews.some((review) => review.user.id === userId);
                }
            },

            // Handle submitting a new review
            submitReview() {
                if (!this.form.comment.trim()) {
                    alert('Please enter your comment before submitting.');
                    return;
                }

                const _this = this;
                this.httpReq({
                    customUrl: this.form.id ? 'api/reviews' : 'api/review/course-reviews',
                    method: this.form.id ? 'put' : 'post',
                    urlSuffix: this.form.id ?? false,
                    data: _this.form,
                    callback(response) {
                        if (response.data) {
                            // Update the review list
                            const newReview = response.data.result;

                            if (!_this.form.id ) {
                                newReview.user = _this.auth;
                                _this.reviewsLikes[newReview.id] = [];
                                _this.reviews.push(newReview);
                                // Mark that the user has reviewed the course
                                _this.hasReviewed = true;
                            }

                            // Reset the form
                            _this.form = {
                                rating: 0,
                                comment: '',
                            };
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

            cancelUpdate() {
                this.form = {
                    rating: 0,
                    comment: '',
                };
            },

            // Set rating for new review
            setRating(rate) {
                this.form.rating = rate;
            },

            // Set hover rating
            setHoverRating(rate) {
                this.hoverRating = rate;
            },

            // Get star class for new review rating
            getStarClass(rate) {
                return this.hoverRating >= rate || this.form.rating >= rate ? 'fas fa-star': 'far fa-star';
            },

            isUpdating(review) {
                return this.form && this.form.id === review.id;
            },
            doLike(type = this.TYPE_LIKE_COURSE, id = this.course.id) {
                if (this.isEmptyData(this.auth)) return;

                let customUrl = 'api/courses/do-like';
                let likesArr = this.likes;
                let data = {
                    course_id: id,
                };

                if (type === this.TYPE_LIKE_REVIEW) {
                    customUrl = 'api/reviews/do-like';
                    likesArr = this.reviewsLikes[id];
                    data = {review_id: id}
                } else if (type === this.TYPE_LIKE_LESSON) {
                    customUrl = 'api/lessons/do-like';
                    likesArr = this.lessonsLikes[id];
                    data = {lesson_id: id}
                }

                // api/reviews/do-like

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

            downloadCertificate() {
                const doc = new jsPDF('landscape', 'mm', 'a4'); // Landscape orientation

                // Background color
                doc.setFillColor(240, 240, 240); // Light gray background
                doc.rect(0, 0, doc.internal.pageSize.width, doc.internal.pageSize.height, 'F');

                // Outer Border (Info Color)
                const outerBorderWidth = 1;
                doc.setLineWidth(outerBorderWidth);
                doc.setDrawColor(0, 123, 255); // Info color (Bootstrap primary)
                doc.rect(outerBorderWidth, outerBorderWidth, doc.internal.pageSize.width - (outerBorderWidth * 2), doc.internal.pageSize.height - (outerBorderWidth * 2));

                // Inner Border (#002347)
                const innerBorderWidth = 10;
                doc.setLineWidth(1); // 1px thickness
                doc.setDrawColor(0, 35, 71); // #002347 in RGB
                doc.roundedRect(innerBorderWidth, innerBorderWidth, doc.internal.pageSize.width - (innerBorderWidth * 2), doc.internal.pageSize.height - (innerBorderWidth * 2), 10, 10);

                // Title
                doc.setFont('Helvetica', 'bold');
                doc.setFontSize(36);
                doc.setTextColor(0, 51, 153); // Dark blue color
                doc.text('CERTIFICATE OF COMPLETION', doc.internal.pageSize.width / 2, 30, {align: 'center'});

                // Subtitle
                doc.setFontSize(20);
                doc.setFont('Helvetica', 'normal');
                doc.setTextColor(0, 0, 0); // Black color
                doc.text('This certificate is awarded to', doc.internal.pageSize.width / 2, 50, {align: 'center'});

                // Student Name
                doc.setFontSize(28);
                doc.setFont('Georgia', 'italic'); // Cursive-like font
                doc.text(this.auth ? this.auth.name : 'NA', doc.internal.pageSize.width / 2, 60, {align: 'center'});

                // Horizontal Line for Course Title
                doc.setDrawColor(0, 51, 153); // Blue color
                doc.setLineWidth(1);
                doc.line(40, 80, doc.internal.pageSize.width - 40, 80); // Horizontal line

                // Course Title
                doc.setFontSize(20);
                doc.setFont('Helvetica', 'bold');
                doc.text('For successfully completing:', doc.internal.pageSize.width / 2, 90, {align: 'center'});

                // Course title in a separate line
                doc.setFontSize(22);
                doc.setFont('Georgia', 'bold'); // Cursive-like font
                doc.text(this.course.title || 'Course Title', doc.internal.pageSize.width / 2, 100, {align: 'center'});

                // Body text
                doc.setFontSize(14);
                doc.setFont('Helvetica', 'normal');
                doc.text('', doc.internal.pageSize.width / 2, 210, {align: 'center', maxWidth: 190});

                // Completion Date
                const currentDate = new Date();
                const year = currentDate.getFullYear();   // e.g., 2024
                const month = currentDate.getMonth() + 1; // Month is 0-based, so add 1 (e.g., 10 for October)
                const day = currentDate.getDate();        // e.g., 24
                doc.setFontSize(12);
                doc.text(`Completion Date: ${year}-${month}-${day}`, 30, doc.internal.pageSize.height - 60);

                // Horizontal Line for Signature
                doc.setDrawColor(0, 0, 0); // Black color
                doc.setLineWidth(1);
                doc.line(30, doc.internal.pageSize.height - 50, 120, doc.internal.pageSize.height - 50); // Left signature line

                // Set font for signature text to normal
                doc.setFont('Helvetica', 'normal'); // Change to normal
                doc.text('CSE Engineer Signature', 30, doc.internal.pageSize.height - 45); // Left Signature Text

                // Horizontal Line for Head Sir Signature
                doc.line(doc.internal.pageSize.width - 120, doc.internal.pageSize.height - 50, doc.internal.pageSize.width - 30, doc.internal.pageSize.height - 50); // Right signature line
                doc.text('Head Sir Signature', doc.internal.pageSize.width - 120, doc.internal.pageSize.height - 45); // Right Signature Text

                // Add 30-word Lorem Ipsum text
                doc.setFontSize(12);
                const loremText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
                doc.text(loremText, 30, doc.internal.pageSize.height - 90, {maxWidth: doc.internal.pageSize.width - 60}); // Add Lorem Ipsum text

                // Save the PDF
                doc.save(`${this.auth ? this.auth.name : 'NA'}_Certificate_${new Date()}.pdf`);
            }

        },
        computed: {
            course_id() {
                return this.$route.params.id;
            },
            lesson_id() {
                return this.$route.params.id;
            },
        },
    };
</script>

<style scoped>
    /* Styles for Course Details */

    .course-details li {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 1.2rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #e0e0e0;
    }

    .review-item .user-thumb img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }


    .playlist {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 10px;
        background-color: #002347;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .playlist .card {
        border: 0;
        border-bottom: 1px solid #e0e0e0;
        background-color: #fff;
        border-radius: 8px;
        transition: background-color 0.3s ease;
        color: #333;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    .playlist .card:hover {
        background-color: #f5f1ff !important;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .playlist .highlight-card {
        background-color: #f5f5f5;
        border-left: 3px solid #e91e63;
    }

    .card-body h6 {
        color: #002347;
        font-size: 0.8rem;
    }

    .card-body p {
        color: #777;
        font-size: 0.8rem;
    }

    .btn-custom {
        background-color: #002347;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.3s ease;
        width: 100%;
    }

    .btn-custom:hover {
        background-color: #001d32;
        color: #ffffff;
        transform: translateY(-2px);
    }

    .btn-custom {
        background-color: #002347;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.3s ease;
        width: 100%;
    }

    .btn-custom:hover {
        background-color: #001d32;
        color: #ffffff;
    }

</style>