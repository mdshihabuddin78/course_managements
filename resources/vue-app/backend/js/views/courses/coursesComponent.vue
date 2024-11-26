
<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('course_add')" :init-form-data="{category_id: '', sub_category_id: ''}">
            <tr v-for="(course, index) in dataList.data" style="font-size: 0.8rem" :key="course.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>
                    <img :src="generateFileUrl(course.thumbnail, TYPE_COURSE)" style="width: 50px; height: 35px; border-radius: 0%" alt="">
                </td>
                <td>{{ limitText(course.title) }}</td>
                <td>{{ limitText(course.category ? course.category.title : '' )}}</td>
                <td>{{ formatDecimal(course.price) }}</td>
                <td>{{ course.sits }}/00</td>
                <td>
                    {{ course.quizzes ? course.quizzes.length : '' }}

                    <i class="ml-1 fas fa-plus" data-toggle="modal" :data-target="`#quizzesModal${course.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`quizzesModal${course.id}`" :title="`${course.title} => Quizzes`">
                        <div v-for="(quiz, index) in course.quizzes" :key="index" class="p-2 d-flex align-items-center justify-content-between" :style="{ backgroundColor: index % 2 === 0 ? '#e9e9e9' : '#f5f5f5' }">
                            <li style="list-style-type: decimal">{{ quiz.title }}</li>
                            <button @click="manipulateQuiz(quizzes, course, {course_id: course.id, quiz_id: quiz.id}, 'course')" class="btn btn-danger px-1">Remove</button>
                        </div>
                        <label class="form-label d-block mt-5">
                            Add Quiz
                            <select @change="(event)=>{manipulateQuiz(quizzes, course, {course_id: course.id, quiz_id: event.target.value}, 'course')}" class="form-control">
                                <option value="">Select a new quiz</option>
                                <option v-for="quiz in quizzes" v-if="!course.quizzes.map(q => q.id).includes(quiz.id)" :key="quiz.id" :value="quiz.id">
                                    {{ quiz.title }}
                                </option>
                            </select>
                        </label>
                    </show-details-modal>
                </td>
                <td>
                    <span :class="course.status === 1 ? 'badge badge-success' : course.status === 2 ? 'badge badge-warning' : 'badge badge-danger'">
                        {{ course.status === 2 ? 'Pending' : course.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>
                <td>
                    <!--    edit btn    -->
                    <button v-if="can('course_edit')" @click="onClickUpdate(course)" class="btn btn-primary btn-sm" :title="`Edit ${course.title}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!--    delete btn    -->
                    <button v-if="can('course_delete')" @click="deleteItem(course.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${course.title}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>

        <!--  Modal  -->
        <validate-form-modal title="Course" width="700px" :current-page="dataList.current_page">
            <div>
                <div class="upload-area d-block m-auto" @click="() => {$refs.fileInput.click()}">
                    <img :src="generateFileUrl(formData.thumbnail, TYPE_UPLOAD)" alt="Preview" class="preview-img"/>
                </div>
                <input type="file" ref="fileInput" @change="handleFileUpload" class="file-input" accept="image/*"/>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Title
                    <input type="text" class="form-control" v-model="formData.title" v-validate="'required|min:3|max:255'" name="title" @input="validateField($event, true)"/>
                </label>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label d-block">
                        Category
                        <select class="form-control" v-model="formData.category_id" v-validate="'required'" name="category_id" @change="validateField">
                            <option value="">Select a category</option>
                            <option v-for="category in categories" :key="category.id" :value="category.id">
                                {{ category.title }}
                            </option>
                        </select>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label d-block">
                        Sub Category
                        <select class="form-control" v-model="formData.sub_category_id" v-validate="'required'" name="sub_category_id" @change="validateField">
                            <option value="">Select a subCategory</option>
                            <option v-for="subCategory in subCategories" :key="subCategory.id" :value="subCategory.id">
                                {{ subCategory.title }}
                            </option>
                        </select>
                    </label>
                </div>
            </div>
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Start Date
                        <input type="date" class="form-control" v-model="formData.start_date" v-validate="" name="title" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        End Date
                        <input type="date" class="form-control" v-model="formData.end_date" v-validate="" name="title" @input="validateField"/>
                    </label>
                </div>
            </div>
            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Price
                        <input type="number" step="0.01" min="0" class="form-control" placeholder="Enter course price" v-model="formData.price" v-validate="'required|decimal'" name="price" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Sits
                        <input type="number" class="form-control" placeholder="Enter available sits" v-model="formData.sits" v-validate="'required|numeric'" name="sits" @input="validateField"/>
                    </label>
                </div>
            </div>

            <div v-if="[0, 1].includes(formData.status)" class="mb-3">
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch" v-model="formData.status" :true-value="1" :false-value="0"/>
                    <label class="custom-control-label" for="customSwitch">
                        {{ formData.status ? 'Active' : 'Inactive' }}
                    </label>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Description
                    <vue2-tinymce-editor v-model="formData.description"></vue2-tinymce-editor>
                </label>
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
        name: "coursesComponent",
        components: {Vue2TinymceEditor, ShowDetailsModal, ValidateFormModal, DataTable, Pagination }, // Register Pagination component
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Thumbnail', 'Title', 'Category', 'Price(TK)', 'Sits/Sold', 'Quizzes', 'Status', 'Actions'],
                categories: {},
                subCategories: {},
                quizzes: {},
            };
        },

        mounted() {
            const _this = this;
            // Fetch all courses with paginated
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: _this.perPage}));

            // Fetch categories and sub-categories
            this.fetchData(this.urlGenerate('api/required-data', false, {categories: true, sub_categories: true, quizzes: false}), (result) => {
                _this.categories = result.categories;
                _this.subCategories = result.sub_categories;
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
