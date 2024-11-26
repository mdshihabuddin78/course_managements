<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('question_add')" :init-form-data="{quiz_id: ''}">
            <tr v-for="(question, index) in dataList.data" style="font-size: 0.8rem" :key="question.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>{{ limitText(question.title) }}</td>
                <td>{{ limitText(question.quiz ? question.quiz.title : '') }}</td>
                <td>
                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#questionsModal${question.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`questionsModal${question.id}`" :title="`${question.title} => Options`">
                        <div class="row">
                             <span v-for="(option, index) in questionOptions" :key="index" v-if="question[option.key]" :class="['col-md-6 my-1', question.correct_answer === option.label.toLowerCase() ? 'text-success' : '']">
                              <strong>{{ option.label }}.</strong> {{ question[option.key] }}
                            </span>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    <!-- Edit button -->
                    <button v-if="can('question_edit')" @click="onClickUpdate(question)" class="btn btn-primary btn-sm" :title="`Edit ${question.title}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('question_delete')" @click="deleteItem(question.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${question.title}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

<!-- pagination Control-->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>


        <validate-form-modal title="Question" :current-page="dataList.current_page" width="700px">
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Title
                        <input type="text" class="form-control" v-model="formData.title" v-validate="'required|min:3|max:255'" name="title" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label d-block">
                        Quiz
                        <select class="form-control" v-model="formData.quiz_id" v-validate="'required'" name="quiz_id" @change="validateField">
                            <option value="">Select a Quiz</option>
                            <option v-for="quiz in quizzes" :key="quiz.id" :value="quiz.id">
                                {{ quiz.title }}
                            </option>
                        </select>
                    </label>
                </div>
            </div>
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Option A
                        <input type="text" class="form-control" v-model="formData.option_a" v-validate="'required'" name="option_a" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Option B
                        <input type="text" class="form-control" v-model="formData.option_b" v-validate="'required'" name="option_b" @input="validateField"/>
                    </label>
                </div>
            </div>
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Option C
                        <input type="text" class="form-control" v-model="formData.option_c" v-validate="'required'" name="option_c" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Option D
                        <input type="text" class="form-control" v-model="formData.option_d"/>
                    </label>
                </div>
            </div>
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label d-block">
                        Correct Answer
                        <select class="form-control" v-model="formData.correct_answer">
                            <option value="">Select the correct one</option>
                            <option v-for="(option, index) in questionOptions" :key="index" :value="option.label.toLowerCase()">
                                {{ option.label }}
                            </option>
                        </select>
                    </label>
                </div>
            </div>
        </validate-form-modal>
    </div>
</template>


<script>
    import DataTable from "../../components/dataTable";
    import ValidateFormModal from "../../components/validateFormModal";
    import Pagination from "../../components/Pagination"; // Import your Pagination component
    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";
    import ShowDetailsModal from "../../components/showDetailsModal";

    export default {
        name: "questionsComponent",
        components: {ShowDetailsModal, ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Title', 'Quiz', 'Options', 'Actions'],
                permPrefix: 'question',
                quizzes: [],
            }
        },
        mounted() {
            this.formData.quiz_id = "";
            this.formData.correct_answer = "";
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));

            // Fetch quizzes
            const _this = this;
            this.fetchData(this.urlGenerate('api/required-data', false, {'quizzes': true}), (result) => {
                _this.quizzes = result.quizzes;
            });
        }
    }
</script>

<style scoped>
    .upload-area {
        width: 300px;
        height: 200px;
        border: 2px dashed #34a9cc;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }

    .preview-img {
        width: 100%;
        height: 100%;
    }

    .file-input {
        display: none;
    }
</style>
