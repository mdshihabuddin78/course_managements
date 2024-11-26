<template>
    <div>
        <h4 class="title mt-2">Lessons</h4>
        <div class="playlist">
            <div v-if="!isEmptyData(lessons)" v-for="(lesson, index) in lessons" :key="lesson.id" :class="['card my-2', { 'highlight-card': id === lesson.id }]" :style="`background: ${isHighlighted(lesson.id, index) ? '#fff' : '#d4d4d4'};`">
                <div @click="id !== lesson.id && goToLesson(lesson.id, index)" class="row no-gutters pointer align-items-center">
                    <div class="col-md-4 justify-content-center">
                        <img class="img-fluid" :src="generateFileUrl(lesson.thumbnail, TYPE_LESSON)" alt="Course Image" style="border: 1px solid #ddd; padding: 5px; margin: 10px; border-radius: 8px;" >
                    </div>

                    <div class="col-md-8 py-3 pl-3">
                        <h6 class="card-title mb-0">{{ lesson.title }}</h6>
                        <p class="card-text"><i class="fas fa-clock primary-text2"></i> {{ !isEmptyData(lesson.video) ? formatSecondsToTime(lesson.video.duration) : 'NA' }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "lessonsPlaylistComponent",

        props: {
            id: Number,
            lessons: Array,
            runningInfo: Object,
        },

        methods: {
            goToLesson(lessId, index) {
                const crrLessId = this.runningInfo.current_lesson_id;
                const _this = this;

                if (crrLessId >= lessId)
                    this.$router.push({ name: 'lesson', params: { id: lessId } });
                else if(this.isCompleteLesson(index-1)) { // if prev is complete the go
                    this.httpReq({
                        customUrl: 'api/courses/running-infos',
                        urlSuffix: this.runningInfo.ric_id ? this.runningInfo.ric_id : this.runningInfo.id,
                        method: 'put',
                        data: {current_lesson_id: lessId},
                        callback: () => {
                            this.$router.push({ name: 'lesson', params: { id: lessId } });
                        },
                    });
                } else {
                    this.showSweetAlert({
                        title: 'Locked Lesson',
                        text: 'To continue this lesson you need to complete previous lessons and all quizzes. Want to continue where you left?',
                        callback: (confirm) => {
                            if (confirm)
                                _this.$router.push({name: 'lesson', params: {id: crrLessId}});
                        }
                    });
                }
            },
            isCompleteLesson(index) {
                if (index < 0) return true;
                const less = !this.isEmptyData(this.lessons) ? this.lessons[index] : null;
                return this.runningInfo && this.runningInfo.completed_lessons_id && less && this.runningInfo.completed_lessons_id.includes(less.id);
            },

            isHighlighted(less_id, index) {
                return (this.isEmptyData(this.runningInfo.current_lesson_id) && index === 0) || this.runningInfo.current_lesson_id >= less_id;
            }
        }
    }
</script>

<style scoped>

    .review-item .user-thumb img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .playlist {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 10px 15px;
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
        background: #deebff !important;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .playlist .highlight-card {
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
</style>