<template>
    <div>
        <data-table :table-heading="tableHeading" :show-add-btn="can(permPrefix +'_'+PERM_ADD)" :init-form-data="{status: 1}">
            <tr v-for="(role, index) in dataList.data" style="font-size: 0.8rem" :key="role.id">
                <td>{{ (dataList.current_page - 1) * perPage  + index + 1 }}</td>
                <td>{{ limitText(role.name) }}</td>
                <td>
                    {{ role.users ? role.users.length : 'NA' }}

                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#roleUsersModal${role.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`roleUsersModal${role.id}`" :title="`${role.name} => Users`">
                        <div class="row">
                            <li class="col-md-6 my-1" v-for="user in role.users">
                                {{ user.name }}
                            </li>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    {{ role.modules ? role.modules.length : 'NA' }}

                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#roleModulesModal${role.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`roleModulesModal${role.id}`" :title="`${role.name} => Modules`">
                        <div class="row">
                            <li class="col-md-6 my-1" v-for="module in role.modules">
                                {{ module.name }}
                            </li>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    {{ role.permissions ? role.permissions.length : 'NA' }}

                    <i class="ml-1 fa fa-eye" data-toggle="modal" :data-target="`#rolePermissionsModal${role.id}`" style="cursor: pointer"></i>
                    <show-details-modal :id="`rolePermissionsModal${role.id}`" :title="`${role.name} => Permissions`">
                        <div class="row">
                            <li class="col-md-6 my-1" v-for="permission in role.permissions">
                                {{ permission.name }}
                            </li>
                        </div>
                    </show-details-modal>
                </td>
                <td>
                    <span :class="role.status ? 'badge badge-success' : 'badge badge-danger'">
                        {{ role.status ? 'Active' : 'Inactive' }}
                    </span>
                </td>

                <td>
                    <!-- Edit button -->
                    <button v-if="can(permPrefix +'_'+PERM_EDIT)" @click="onClickUpdate(role)" class="btn btn-primary btn-sm" :title="`Edit ${role.name}`" type="button">
                        <i class="fa fa-edit"></i>
                    </button>
                    <!-- Delete button -->
                    <button v-if="can(permPrefix +'_'+PERM_DELETE)" @click="deleteItem(role.id, dataList.current_page, perPage)" class="btn btn-danger btn-sm" :title="`Delete ${role.name}`" type="button">
                        <i class="fa fa-trash text-white"></i>
                    </button>
                    <!-- Mange button -->
                    <router-link v-if="can(permPrefix +'_'+PERM_MANAGE)" :to="{ name: 'manageRoles', params: { role_id: role.id } }" class="btn btn-warning btn-sm" :title="`Manage ${role.name}`" type="button">
                        <i class="fa fa-cogs text-white"></i>
                    </router-link>
                </td>
            </tr>
        </data-table>


        <!-- Pagination Control -->
        <Pagination v-if="dataList.last_page > 1" :currentPage="dataList.current_page" :lastPage="dataList.last_page"/>


        <validate-form-modal  title="Role" :current-page="dataList.current_page">
            <div class="mb-3">
                <label class="form-label w-100">
                    Name
                    <input type="text" class="form-control" v-model="formData.name" v-validate="'required|min:3|max:255'" name="name" @input="validateField"/>
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
                permPrefix: 'role',
                tableHeading: ['SL', 'Role','Users', 'Modules', 'Permissions', 'Status', 'Action'],
            }
        },

        mounted() {
            // Fetch datalist with paginate
            this.fetchData(this.urlGenerate(false, false, {page: 1, perPage: this.perPage}));
        }
    }
</script>