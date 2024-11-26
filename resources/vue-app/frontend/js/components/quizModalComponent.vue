<template>
    <!-- Modal -->
    <div class="modal fade" :id="id" tabindex="-1" role="dialog" aria-labelledby="quizModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document" :style="{maxWidth: windowWidth >= 700 ? '700px' : '90%'}">
            <div class="modal-content" style="background-color: #002347; color: #ffffff;">
                <div class="modal-header">
                    <h5 class="modal-title text-white" id="quizModalLabel">{{ quiz.title }}</h5>
                    <button @click="closeModal('#'+id)" type="button" class="close text-white" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div v-for="(question, indexQ) in quiz.questions" v-if="!isSolveQs(question)" :key="question.id" class="card mb-3">
                        <div class="card-body" style="background-color: #ffffff; color: #333;">
                            <h6 class="card-title">{{ indexQ + 1 - getSolvedQsN(quiz.questions) }}. {{ question.title }}</h6>
                            <div class="row mx-2">
                                <div v-for="(option, index) in questionOptions" v-if="question[option.key]" :key="index" class="form-check col-md-6">
                                    <label class="form-check-label" :for="'answer' + question.id + index">
                                        <input class="form-check-input" type="radio" :id="'answer' + question.id + index" :value="option.label.toLowerCase()" v-model="formData[question.id]">
                                        {{ option.label }}. {{ question[option.key] }}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button @click="closeModal('#'+id)" type="button" class="btn btn-secondary">Close</button>
                    <button type="button" class="btn btn-primary" @click="submitAnswers">Submit Answers</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "quizModalComponent",
        data() {
            return {
                windowWidth: window.innerWidth,
            }
        },
        props: {
            quiz: {
                type: Array | Object,
                default: {},
            },
            runningInfo: {
                type: Array | Object,
                default: {},
            },
            nextQuizId: Number,
            id: String,
        },
        methods: {
            submitAnswers() {
                // Prepare the data to be sent
                const answersToSubmit = Object.keys(this.formData).map(questionId => {
                    return {
                        question_id: questionId,
                        answer: this.formData[questionId],
                    };
                });

                const _this = this;
                this.httpReq({
                    method: 'post',
                    customUrl: 'api/quizzes/submit',
                    data: answersToSubmit,
                    callback: (response) => {
                        if (response.data) {
                            let solvedIds = response.data.result;
                            let totalQs = (_this.quiz && _this.quiz.questions ? _this.quiz.questions.length : 0) - this.getSolvedQsN(this.quiz ? this.quiz.questions : null);
                            let solvedQs = solvedIds ? solvedIds.length : 0;
                            let failedQs = totalQs - solvedQs;

                            // all questions are correct, no need to open modal
                            if (!failedQs) _this.closeModal('#'+_this.id);

                            _this.showSweetAlert({
                                title: 'Quiz Summary',
                                text: `Total Qs: "${totalQs}", Solved: "${solvedQs}", Failed: "${failedQs}"`,
                                icon: failedQs ? 'warning' : 'success',
                                cancelButtonText: 'Retry',
                                confirmButtonText: failedQs ? 'Quit' : 'Done',
                                showCancelButton: failedQs !== 0,
                                callback: (confirm) => {
                                    if (confirm) _this.closeModal('#'+_this.id);
                                }
                            });

                            // if done move the current_quiz_it to next
                            if (!failedQs) {
                                let data = {current_quiz_id: _this.nextQuizId};
                                const customUrl = _this.runningInfo.ric_id ? 'api/lessons/running-infos' : 'api/courses/running-infos';  // lesson runningInfo always contains ric_id

                               if (!_this.nextQuizId && _this.runningInfo.lesson_id) {
                                    // it's from lesson and it's the last quiz , lesson done
                                    data.status = 1;
                                    if(!_this.isEmptyData(_this.runningInfo.completed_lessons_id)) _this.runningInfo.completed_lessons_id.push(_this.runningInfo.lesson_id);
                                }
                                this.httpReq({
                                    customUrl,
                                    urlSuffix: _this.runningInfo.id,
                                    method: 'put',
                                    data,
                                    callback: (reponse) => {
                                        if (reponse.data && reponse.data.result)
                                            _this.runningInfo.current_quiz_id = reponse.data.result.current_quiz_id;
                                    },
                                });
                            }

                            if (!_this.isEmptyData(_this.auth) && !_this.isEmptyData(solvedIds))
                                _this.auth.solved_questions_id.push(...solvedIds)
                        }
                        // close the modal
                    }
                });
            },
        }
    }
</script>


<style scoped>

</style>