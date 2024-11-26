<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('quiz_add')">
            <tr v-for="(data, index) in dataList.data" style="font-size: 0.8rem" :key="data.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>{{ limitText(data.title) }}</td>
                <td>
                    {{ data.questions ? data.questions.length : 'NA' }}

                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#questionsModal${data.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`questionsModal${data.id}`" :title="`${data.title} => Questions`">
                            <li class="my-1" v-for="question in data.questions" style="list-style-type: decimal">
                                {{ question.title }}
                            </li>
                    </show-details-modal>
                </td>
                <td>
                    <!-- Edit button -->
                    <button v-if="can('quiz_edit')" @click="onClickUpdate(data)" class="btn btn-primary btn-sm" :title="`Edit ${data.title}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('quiz_delete')" @click="deleteItem(data.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${data.title}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

<!-- pagination Control-->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>


        <validate-form-modal title="Category" :current-page="dataList.current_page">
            <div class="mb-3">
                <label class="form-label w-100">
                    Title
                    <input type="text" class="form-control" v-model="formData.title" v-validate="'required|max:255'" name="title" @input="validateField"/>
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label w-100">
                    Time Limit(Second)
                    <input type="number" class="form-control" v-model="formData.time_limit"/>
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

    export default {
        name: "quizzesComponent",
        components: {ShowDetailsModal, ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Title', 'Questions', 'Actions'],
                permPrefix: 'quiz'
            }
        },
        mounted() {
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));
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
