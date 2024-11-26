<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="false">
            <tr v-for="(data, index) in dataList.data" style="font-size: 0.8rem" :key="data.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>{{ data.user ? data.user.name : '' }}</td>
                <td>{{ limitText(data.comment) }}</td>
                <td>{{ data.rating}}</td>
                <td>
                    <span :class="data.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ data.status ? 'Showing' : 'Hidden' }}
                    </span>
                </td>
                <td>
                    <!--    edit btn    -->
                    <button v-if="can('review_edit')" @click="onClickUpdate(data)" class="btn btn-primary btn-sm" title="Edit" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!--    delete btn    -->
                    <button v-if="can('review_delete')" @click="deleteItem(data.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" title="Delete" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>

        <validate-form-modal title="Category" :current-page="dataList.current_page">

            <div class="mb-3">
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
    import Pagination from "../../components/Pagination"
    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";

    export default {
        name: "reviewsComponent",
        components: {ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Users','Comment','Rating', 'Status', 'Actions'],
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
