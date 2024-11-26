
<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('lesson_add')" :init-form-data="{status: 1, course_id: ''}">
            <tr v-for="(lesson, index) in dataList.data" style="font-size: 0.8rem" :key="lesson.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>
                    <img :src="generateFileUrl(lesson.thumbnail, TYPE_LESSON)" style="width: 50px; height: 35px; border-radius: 0%" alt="">
                </td>
                <td>{{ limitText(lesson.title) }}</td>
                <td>{{ limitText(lesson.course ? lesson.course.title : '') }}</td>
                <td>
                    {{ lesson.quizzes ? lesson.quizzes.length : '' }}

                    <i class="ml-1 fas fa-plus" data-toggle="modal" :data-target="`#quizzesModal${lesson.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`quizzesModal${lesson.id}`" :title="`${lesson.title} => Quizzes`">
                        <div v-for="(quiz, index) in lesson.quizzes" :key="index" class="p-2 d-flex align-items-center justify-content-between" :style="{ backgroundColor: index % 2 === 0 ? '#e9e9e9' : '#f5f5f5' }">
                            <li style="list-style-type: decimal">{{ quiz.title }}</li>
                            <button @click="manipulateQuiz(quizzes, lesson, {lesson_id: lesson.id, quiz_id: quiz.id}, 'lesson')" class="btn btn-danger px-1">Remove</button>
                        </div>
                        <label class="form-label d-block mt-5">
                            Add Quiz
                            <select @change="(event)=>{manipulateQuiz(quizzes, lesson, {lesson_id: lesson.id, quiz_id: event.target.value}, 'lesson')}" class="form-control">
                                <option value="">Select a new quiz</option>
                                <option v-for="quiz in quizzes" v-if="!lesson.quizzes.map(q => q.id).includes(quiz.id)" :key="quiz.id" :value="quiz.id">
                                    {{ quiz.title }}
                                </option>
                            </select>
                        </label>
                    </show-details-modal>
                </td>
                <td>
                    <span :class="lesson.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ lesson.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>
                <td>
                    <!--    edit btn    -->
                    <button v-if="can('lesson_edit')" @click="onClickUpdate(lesson)" class="btn btn-primary btn-sm" :title="`Edit ${lesson.title}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!--    delete btn    -->
                    <button v-if="can('lesson_delete')" @click="deleteItem(lesson.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${lesson.title}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>

        <validate-form-modal title="Lessons" width="700px" :current-page="dataList.current_page">
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <div class="upload-area d-block m-auto" @click="$refs.thumbnailInput.click()">
                        <img :src="generateFileUrl(formData.thumbnail, TYPE_UPLOAD)" alt="Preview" class="preview-img"/>
                    </div>
                    <input type="file" ref="thumbnailInput" @change="handleFileUpload" class="file-input" accept="image/*"/>
                    <h5 class="text-center pt-1">Thumbnail</h5>
                </div>

                <div class="w-50 pl-2">
                    <div class="upload-area d-block m-auto" @click="$refs.videoInput.click()">
                        <img v-if="isEmptyData(formData.video)" :src="generateFileUrl(null, TYPE_UPLOAD)" alt="Preview" class="preview-img">
                        <video @click.prevent="" v-else ref="lessonVideo" class="rounded w-100" controls>
                            <source :src="generateFileUrl(formData.video, TYPE_LESSON_VIDEO)" type="video/mp4">
                            <source :src="generateFileUrl(formData.video, TYPE_LESSON_VIDEO)" type="video/webm">
                            <source :src="generateFileUrl(formData.video, TYPE_LESSON_VIDEO)" type="video/ogg">
                            Your browser does not support the video tag.
                        </video>
                    </div>
                    <input type="file" ref="videoInput" @change="handleFileUpload($event, 'video', formData, $refs.lessonVideo)" class="file-input" accept="video/*"/>
                    <h5 class="text-center pt-1">Video</h5>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Title
                    <input type="text" class="form-control" v-model="formData.title" v-validate="'required|min:3|max:255'" name="title" @input="validateField"/>
                </label>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Course
                    <select class="form-control" v-model="formData.course_id" v-validate="'required'" name="course_id">
                        <option value="" disabled>Select a course</option>
                        <option v-for="course in courses" :key="course.id" :value="course.id">
                            {{ course.title }}
                        </option>
                    </select>
                </label>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Description
                    <vue2-tinymce-editor v-model="formData.description"></vue2-tinymce-editor>
                </label>
            </div>

            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch" v-model="formData.status" :true-value="1" :false-value="0"/>
                    <label class="custom-control-label" for="customSwitch">
                        {{ formData.status ? 'Active' : 'Inactive' }}
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
    import Vue2TinymceEditor from "vue2-tinymce-editor/src/lib-components/Vue2TinymceEditor";

    export default {
        name: "lessonsComponent",
        components: {Vue2TinymceEditor, ShowDetailsModal, ValidateFormModal, DataTable, Pagination },
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Thumbnail', 'Title', 'Courses', 'Quizzes', 'Status', 'Actions'], // Column headings for the data table
                courses: [], // Array to hold courses fetched from the server
                lessons: [], // Data list for lessons
                quizzes: [],
            };
        },

        mounted() {
            const _this = this;

            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: _this.perPage}));

            // Fetch courses for the dropdown

            // Fetch courses and quizzes
            this.fetchData(this.urlGenerate('api/required-data', false, {courses: true, quizzes: true}), (result) => {
                _this.courses = result.courses;
                _this.quizzes = result.quizzes;
            });
        },
    };
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
