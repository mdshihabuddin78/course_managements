<template>
    <div>
        <h4 class="title mt-5">Quizzes</h4>
        <div v-for="(quiz, index) in quizzes" :key="index" class="primary-bg2 p-3 mb-3 rounded">
            <h4 class="text-white mb-0 text-center">{{ quiz.title }}</h4>

            <!-- Quiz Card -->
            <div class="card mt-3">
                <div class="p-2 text-center">
                    <div class="mb-2">
                        <p class="card-text mb-0">{{ getSolvedQsN(quiz.questions) }} solved out of {{ quiz.questions ? quiz.questions.length : 0 }} questions</p>
                        <div class="progress">
                            <div :class="`progress-bar ${isSolvedAllQs(quiz.questions) ? 'primary-bg2' : 'primary-bg3'}`" role="progressbar"
                                 :style="{ width: `${!isEmptyData(quiz.questions) ? getSolvedQsN(quiz.questions)/quiz.questions.length*100 : 100}%` }"
                                 :aria-valuenow="getSolvedQsN(quiz.questions)" aria-valuemin="0"
                                 :aria-valuemax="quiz.questions ? quiz.questions.length : 0">
                            </div>
                        </div>
                    </div>
                    <div v-if="isSolvedAllQs(quiz.questions)" class="genric-btn primary-bg2 circle text-white" style="cursor: default">Solved</div>
                    <div v-else-if="index && runningInfo.current_quiz_id && runningInfo.current_quiz_id < quiz.id" class="genric-btn primary-bg circle text-white" style="cursor: default">Upcoming</div>
                    <button v-else class="genric-btn primary3 circle" data-toggle="modal" :data-target="`#quizModal${quiz.id}`">Take Now</button>
                </div>
            </div>

            <!-- Modal Component -->
            <quiz-modal-component :id="`quizModal${quiz.id}`" :quiz="quiz" :running-info="runningInfo" :next-quiz-id="quizzes[index+1] ? quizzes[index+1].id : null"/>
        </div>
    </div>
</template>

<script>
    import QuizModalComponent from "./quizModalComponent";
    export default {
        name: "quizzesPlaylistComponent",
        components: {QuizModalComponent},

        props: {
            quizzes: Array,
            runningInfo: Object,
        }
    }
</script>

<style scoped>

</style>