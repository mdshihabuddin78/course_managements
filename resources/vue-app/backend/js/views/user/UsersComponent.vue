<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('user_add')" :init-form-data="{role_id: ''}">
            <tr v-for="(user, index) in dataList.data" style="font-size: 0.8rem" :key="user.id">
                <td>{{ (dataList.current_page - 1) * perPage + index + 1 }}</td>
                <td>
                    <img :src="generateFileUrl(user.avatar, TYPE_USER)" style="width: 35px; height: 35px" alt="Avatar">
                </td>
                <td>{{ user.name }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.mobile }}</td>
                <td>{{ user.role ? user.role.name : ''}}</td>
                <td>
                    <span :class="user.status === 1 ? 'badge badge-success' : user.status === 2 ? 'badge badge-warning' : 'badge badge-danger'">
                        {{ user.status === 2 ? 'Requested' : user.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>
                <td>
                    <!-- Edit button -->
                    <button v-if="can('user_edit')" @click="onClickUpdate(user)" class="btn btn-primary btn-sm" :title="`Edit ${user.name}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('user_delete')" @click="deleteItem(user.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${user.name}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>

        <validate-form-modal title="User" width="700px" :init-val="initVal" :current-page="dataList.current_page">
            <div class="mb-3">
                <div class="upload-area mx-auto" @click="() => {$refs.fileInput.click()}">
                    <img :src="generateFileUrl(formData.avatar, TYPE_USER)" alt="Preview" class="preview-img"/>
                </div>
                <input type="file" ref="fileInput" @change="handleFileUpload($event, 'avatar')" class="file-input" accept="image/*"/>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label d-block">
                        Name
                        <input type="text" class="form-control" v-model="formData.name" v-validate="'required|min:3|max:255'" name="name" @input="validateField"/>
                    </label>
                </div>
                <div class="w-50 pl-2">
                    <label class="form-label d-block">
                        Role
                        <select class="form-control" v-model="formData.role_id" >
                            <option value="">Select a role</option>
                            <option v-for="role in roles" :key="role.id" :value="role.id">
                                {{ role.name }}
                            </option>
                        </select>
                    </label>
                </div>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Email
                        <input type="email" class="form-control" v-model="formData.email" v-validate="'required|email'" name="email" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Mobile
                        <input type="tel" class="form-control" v-model="formData.mobile" v-validate="'numeric|min:10|max:15'" name="mobile" @input="validateField"/>
                    </label>
                </div>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Website
                        <input type="url" class="form-control" v-model="formData.website" v-validate="'url'" name="website" @input="validateField"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Github
                        <input type="url" class="form-control" v-model="formData.github" v-validate="'url'" name="github" @input="validateField"/>
                    </label>
                </div>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pr-2">
                    <label class="form-label w-100">
                        Birth
                        <input type="date" class="form-control" v-model="formData.date_of_birth"/>
                    </label>
                </div>

                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Location
                        <input type="text" class="form-control" v-model="formData.location"/>
                    </label>
                </div>
            </div>

            <div class="mb-3 d-flex">
                <div class="w-50 pl-2">
                    <label class="form-label w-100">
                        Set Password
                        <input type="password" class="form-control" v-model="formData.password" v-validate="'required|min:6'" name="password" @input="validateField"/>
                    </label>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label w-100">
                    Bio
                    <vue2-tinymce-editor v-model="formData.bio"></vue2-tinymce-editor>
                </label>
            </div>

            <div v-if="[0, 1].includes(formData.status)" class="mb-3">
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
    import Vue2TinymceEditor from "vue2-tinymce-editor/src/lib-components/Vue2TinymceEditor";

    export default {
        name: "categoriesComponent",
        components: {Vue2TinymceEditor, ValidateFormModal, DataTable, Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Avatar', 'Name', 'Email', 'Mobile', 'Role', 'Status', 'Actions'],
                roles: [],
                initVal: {role_id: '', password: 'ss guest', status: 2},
                permPrefix: 'user'
            }
        },
        mounted() {
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));
            // Fetch role
            const _this = this;
            this.fetchData(this.urlGenerate('api/required-data', false, {'roles': true}), (result) => {
                _this.roles = result.roles;
            });

            this.$store.commit('setFormData', this.initVal)
        }
    }
</script>

<style scoped>
    .upload-area {
        width: 200px;
        height: 200px;
        overflow: hidden;
        border: 2px dashed #34a9cc;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }

    .preview-img {
        max-width: 100%;
        max-height: 100%;
        margin: auto;
    }

    .file-input {
        display: none;
    }
</style>
