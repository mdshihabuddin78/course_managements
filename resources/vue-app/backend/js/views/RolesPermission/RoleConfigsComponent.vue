<template>
    <div v-if="can(`${permPrefix}_${PERM_VIEW}`)">
        <!-- Form to Add Roles Only -->
        <div class="role-permission-form row d-flex align-items-center px-4 py-3">
            <div class="col-4">
                <select @change="getRolePermissions(formData.role_id)" v-model="formData.role_id" name="role_id" required class="role-select">
                    <option disabled value="" selected>Select a Role</option>
                    <option v-for="role in roles" :key="role.id" :value="role.id">{{ role.name }}</option>
                </select>
            </div>
            <h1 class="col-4">Role Configuration</h1>
            <div class="col-4 d-flex justify-content-end">
                <router-link to="/admin/config/roles" class="add-button">All Roles</router-link>
            </div>
        </div>


        <!-- Table to Display Permissions -->
        <div class="m-4 overflow-hidden">
            <h4 class="mb-1">Permissions:</h4>
            <table class="role-permission-table">
                <thead>
                <tr>
                    <th class="p-1" style="white-space: nowrap; width: 0">PID</th>
                    <th class="p-1" style="white-space: nowrap; width: 0">ID</th>
                    <th>Modules</th>
                    <th colspan="4">Permissions</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="module in modules" :key="module.id" :style="{ backgroundColor: getDynamicColor(module.parent_id !== 0 ? module.parent_id : module.id, 0.07) }">
                    <td :style="{ backgroundColor: getDynamicColor(module.parent_id) }">{{ module.parent_id }}</td>
                    <td :style="{ backgroundColor: getDynamicColor(module.id) }">{{ module.id }}</td>
                    <td>
                        <label class="font-weight-bold">
                            <input @change="addPermission($event, crrRole.modules, module.id, ADD_MODULE)" :checked="crrRole.modules && crrRole.modules.includes(module.id)" type="checkbox"/>
                            {{ module.name }}
                        </label>
                    </td>
                    <td>
                        <div class="row">
                            <div class="col-md-3"  v-for="(permission, pIndex) in module.permissions" :key="pIndex">
                                <label>
                                    <input type="checkbox" @change="addPermission($event, crrRole.permissions, permission.id, ADD_PERMISSION)" :checked="crrRole.permissions && crrRole.permissions.includes(permission.id)"/>
                                    {{ permission.name }}
                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                permPrefix: 'role_config',
                ADD_MODULE: 1,
                ADD_PERMISSION: 2,
                crrRole: {},
                roles: [],
                modules: [],
            };
        },
        mounted() {
            const _this = this;

            // Fetch modules with permissions and roles
            this.fetchData(this.urlGenerate('api/required-data', false, {roles: true, modules: true, with_permissions: true}), (result) => {
                _this.modules = result.modules;
                _this.roles = result.roles;

                // get current role with users, modules, permission
                _this.getRolePermissions();
            });


        },
        methods: {
            addPermission : function (event, objectName, perm_id, type){
                let data = {'role_id' : this.crrRole.id};

                if (type === this.ADD_MODULE) data.module_id = perm_id;
                else if (type === this.ADD_PERMISSION) data.permission_id = perm_id;

                if (event.target.checked) {
                    // add permission
                    this.httpReq({
                        customUrl: 'api/config/roles/add-permission', method: 'post', data, callback: (response) => {
                            if(response.data.result) objectName.push(perm_id);
                        }
                    });
                } else {
                    const _this = this;
                    // remove permission
                    this.httpReq({
                        customUrl: 'api/config/roles/remove-permission', method: 'post', data, callback: (response) => {
                            if (response.data.result) {
                                let {modules, permissions} = response.data.result;
                                modules.forEach((id) => {
                                    _this.removeArrItem(_this.crrRole.modules, id)
                                });
                                permissions.forEach((id) => {
                                    _this.removeArrItem(_this.crrRole.permissions, id)
                                });
                            }
                        }
                    });
                }
            },
            getRolePermissions(id = this.$route.params.role_id) {
                if (!id) {
                    id = this.auth ? this.auth.role_id : undefined;
                }
                if (id) {
                    this.$store.commit('setFormData', {role_id: id});

                    const _this = this;
                    this.fetchData(_this.urlGenerate('api/config/roles', this.formData.role_id), (role) => {
                        _this.crrRole = role;
                    });
                }
            },
            getRawPermName(str) {
                let arr = str.split('_');
                return arr[arr.length - 1];
            },
            getDynamicColor(parentId, a = 0.2) {
                // Adjust the multipliers to spread out the RGB values
                const r = (55 * parentId) % 256;  // Red component based on parentId
                const g = (113 * parentId) % 256; // Green component with a different multiplier
                const b = (176 * parentId) % 256; // Blue component to create unique progression

                // Return the RGBA color string
                return `rgba(${r}, ${g}, ${b}, ${a})`;
            }
        },
    };
</script>

<style scoped>

    h1 {
        text-align: center;
        color: #423a8e;
        font-weight: bold;
        font-size: 1.7em;
    }

    .role-permission-form {
        display: flex;
        justify-content: space-between;
    }

    .role-select {
        min-width: 75%;
        display: block;
        padding: 12px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        font-size: 16px;
        transition: border-color 0.3s, box-shadow 0.3s;
        background-color: #ffffff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .role-select:focus {
        border-color: rgb(66, 58, 142);
        outline: none;
        box-shadow: 0 0 5px rgba(66, 58, 142, 0.5);
    }


    .role-select option {
        background-color: #ffffff;
        color: #333;
        padding: 10px;
        font-size: 16px;

    }


    .add-button {
        padding: 12px 20px;
        background-color: #423a8e;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s, transform 0.3s;
    }

    .add-button:hover {
        background-color: #423a8e;
        transform: translateY(-2px);
    }

    .role-permission-table {
        min-width: 100%;
        border-collapse: collapse;
        text-align: left;
        font-size: 12px;
    }

    .role-permission-table th,
    .role-permission-table td {
        border: 1px solid #dddddd;
        padding: 6px;
    }

    .role-permission-table th {
        background-color: #423a8e;
        color: white;
        font-weight: bold;
    }

    .role-permission-table td {
        color: #555555;
    }

    .role-permission-table tr:hover {
        background-color: rgba(0, 0, 0, 0.07) !important;
    }

    label {
        display: flex;
        cursor: pointer;
        font-weight: normal;
    }

    input[type="checkbox"] {
        margin-right: 5px;
        transform: scale(0.9);
        cursor: pointer;
        accent-color: #3f50f6;
    }


    input[type="checkbox"]:checked {
        background-color: #423a8e;
        border-color: #423a8e;
    }


    label {
        cursor: pointer;
        font-weight: normal;
        margin-bottom: 0;
    }
</style>
























