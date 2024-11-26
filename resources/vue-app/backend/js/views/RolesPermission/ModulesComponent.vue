<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can('module_add')" :init-form-data="{status: 1, parent_id: 0}">
            <tr v-for="(module, index) in dataList.data" style="font-size: 0.8rem" :key="module.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td><i :class="module.icon"></i></td>
                <td>{{ limitText(module.name) }}</td>
                <td>{{ limitText(module.parent ? module.parent.name : 'Root') }}</td>
                <td>{{ module.link }}</td>
                <td>
                    {{ module.roles ? module.roles.length : 'NA' }}
                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#moduleRolesModal${module.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`moduleRolesModal${module.id}`" :title="`${module.name} => Roles`">
                        <div class="row">
                            <li class="col-md-6 my-1" v-for="role in module.roles">
                                {{ role.name }}
                            </li>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    {{ module.permissions ? module.permissions.length : 'NA' }}
                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#modulePermsModal${module.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`modulePermsModal${module.id}`" :title="`${module.name} => Permissions`">
                        <div class="row">
                            <li class="col-md-6 my-1" v-for="permission in module.permissions">
                                {{ permission.name }}
                            </li>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    <span :class="module.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ module.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>

                <td>
                    <!-- Edit button -->
                    <button v-if="can('module_edit')" @click="onClickUpdate(module)" class="btn btn-primary btn-sm" :title="`Edit ${module.name}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can('module_delete')" @click="deleteItem(module.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${module.name}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                    <!-- Mange button -->
                    <router-link v-if="can('module_manage')" :to="{ name: 'manageRoles' }" class="btn btn-warning btn-sm" :title="`Manage ${module.name}`" type="button">
                        <i class="fa fa-cogs text-white"></i>
                    </router-link>
                </td>
            </tr>
        </data-table>

        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>


        <validate-form-modal  title="Module" :current-page="dataList.current_page">
            <div class="mb-3">
                <label class="form-label w-100">
                    Name
                    <input type="text" class="form-control" v-model="formData.name" v-validate="'required|min:3|max:255'" name="name" @input="validateField"/>
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label w-100">
                    Link
                    <input type="text" class="form-control" v-model="formData.link" v-validate="'required|min:3|max:255'" name="link" @input="validateField"/>
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label w-100">
                    Icon
                    <input type="text" class="form-control" v-model="formData.icon" v-validate="'required|min:3|max:255'" name="icon" @input="validateField"/>
                </label>
            </div>
            <div class="mb-3">
                <label class="form-label d-block">
                    Parent
                    <select class="form-control" v-model="formData.parent_id" v-validate="'required'" name="parent_id" @change="validateField">
                        <option :value="0">Parent it self</option>
                        <option v-for="module in modules" :key="module.id" :value="module.id">
                            {{ module.name }}
                        </option>
                    </select>
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
        </validate-form-modal>
    </div>
</template>

<script>
    import DataTable from "../../components/dataTable";
    import ValidateFormModal from "../../components/validateFormModal";
    import Pagination from "../../components/Pagination"
    import validatorListComponentMixin from "../../mixins/validatorListComponentMixin";
    import ShowDetailsModal from "../../components/showDetailsModal";

    export default {
        name: "RolesComponent",
        components: {ShowDetailsModal, ValidateFormModal, DataTable,Pagination},
        mixins: [validatorListComponentMixin],
        data() {
            return {
                tableHeading: ['SL', 'Icon', 'Module', 'Parent', 'Links', 'Roles', 'Perms', 'Status', 'Action'],
                modules: [],
            }
        },

        mounted() {
            this.$store.commit('setFormData', {parent_id: 0, status: 1});
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));

            const _this = this;
            this.fetchData(
                this.urlGenerate('api/required-data', false, {'modules': true, 'parents_only': true}),
                (result) => {
                    _this.modules = result.modules
                }
            );
        }
    }
</script>
