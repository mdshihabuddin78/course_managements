<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('category_add')" :init-form-data="{status: 1}">
            <tr v-for="(data, index) in dataList.data" style="font-size: 0.8rem" :key="data.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>
                    <img :src="generateFileUrl(data.thumbnail, TYPE_CATEGORY)" style="width: 40px; height: 35px; border-radius: 0%" alt="">
                </td>
                <td>{{ limitText(data.title) }}</td>
                <td>
                    <span :class="data.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ data.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>
                <td>
                    <!-- Edit button -->
                    <button v-if="can('category_edit')" @click="onClickUpdate(data)" class="btn btn-primary btn-sm" :title="`Edit ${data.title}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('category_delete')" @click="deleteItem(data.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${data.title}`" type="button">
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
                    <input type="text" class="form-control" v-model="formData.title" v-validate="'required|min:3|max:255'" name="title" @input="validateField($event, true)"/>
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label w-100">
                    Details
                    <textarea type="text" class="form-control" v-model="formData.details" v-validate="'max:500'" name="details" @input="validateField"></textarea>
                </label>
            </div>
            <div class="mb-3">
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch" v-model="formData.status" :true-value="1" :false-value="0"/>
                    <label class="custom-control-label" for="customSwitch">
                        {{ formData.status ? 'Active' : 'Inactive' }}
                    </label>
                </div>
            </div>
            <div>
                <div class="upload-area d-block m-auto" @click="() => {$refs.fileInput.click()}">
                    <img :src="generateFileUrl(formData.thumbnail, TYPE_CATEGORY)" alt="Preview" class="preview-img"/>
                </div>
                <input type="file" ref="fileInput" @change="handleFileUpload" class="file-input" accept="image/*"/>
            </div>
        </validate-form-modal>
    </div>
</template>


<script>
    import DataTable from "../../components/dataTable";
    import ValidateFormModal from "../../components/validateFormModal";
    import Pagination from "../../components/Pagination"; // Import your Pagination component
    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";

    export default {
        name: "categoriesComponent",
        components: {ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL','Thumbnail', 'Title', 'Status', 'Actions'],
                permPrefix: 'category'
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
