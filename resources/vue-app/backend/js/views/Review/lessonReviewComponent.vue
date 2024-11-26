<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="false">
            <tr v-for="(data, index) in dataList.data" style="font-size: 0.8rem" :key="data.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>{{ limitText(data.review ? data.review.comment : '' )}}</td>
                <td>{{ limitText(data.lesson ? data.lesson.title : '' )}}</td>
                <td>
                    <span :class="data.review && data.review.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ data.review && data.review.status ? 'Showing' : 'Hidden' }}
                    </span>
                </td>
                <td>
                    <!-- Edit button -->
                    <button v-if="can('lesson_review_edit')" @click="onClickUpdate(data)" class="btn btn-primary btn-sm" title="Edit" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('lesson_review_delete')" @click="deleteItem(data.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" title="Delete" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>

        <validate-form-modal  title="Course Review" :current-page="dataList.current_page">
            <div v-if="formData.review" class="mb-3">
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch" v-model="formData.review.status" :true-value="1" :false-value="0"/>
                    <label class="custom-control-label" for="customSwitch">
                        {{ formData.review.status ? 'Active' : 'Inactive' }}
                    </label>
                </div>
            </div>
        </validate-form-modal>
    </div>
</template>

<script>
    import DataTable from "../../components/dataTable";
    import ValidateFormModal from "../../components/validateFormModal";
    import Pagination from "../../components/Pagination"

    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";

    export default {
        name: "lessonReviewComponent",
        components: {ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Review','Lesson', 'Status', 'Actions'],
            }
        },
        mounted() {
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));
        }
    }
</script>

<style scoped>

</style>
