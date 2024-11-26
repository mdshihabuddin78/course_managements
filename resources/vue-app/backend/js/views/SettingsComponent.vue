<template>
    <div class="container mt-5">
        <div class="d-sm-flex mb-2 justify-content-between">
            <h3>{{ getSetting('application_name') }} - {{ getSetting('application_slogan') }}</h3>
            <button @click="saveSettings" class="btn btn-primary">Save</button>
        </div>

        <!-- General Settings Section -->
        <div v-for="(settings, groupName) in settingsByGroup" class="form-section">
            <div class="section-title">{{ groupName }} Settings</div>
            <div class="p-3 mx-0 border row">
                <div v-for="setting in settings" class="form-group col-md-6">
                    <label>{{ setting.name }}</label>
                    <input v-if="setting.type === 'text'" type="text" class="form-control" v-model="setting.value">

                    <input v-if="setting.type === 'number'" type="number" class="form-control" v-model.number="setting.value">

                    <textarea v-if="setting.type === 'textarea'" class="form-control" rows="3" v-model="setting.value"></textarea>

                    <template v-if="setting.type === 'select'">
                        <select  class="form-control" v-model="setting.value">
                            <template v-for="item in settingSelects[setting.key]">
                                <option :value="item.id">{{ item.name }}</option>
                            </template>
                        </select>
                    </template>

                    <div v-else-if="setting.type === 'file'" class="file-upload-wrapper">
                        <img :src="asset('backend/assets/images/logo-backend.png')" alt="Logo">
                        <br>
                        <input type="file" class="btn btn-upload btn-primary mt-2">
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>
<script>
    export default {
        name: "SettingsComponent",

        data () {
            return {
                settingsByGroup: [],
                settingSelects: [],
            }
        },
        mounted() {
            const _this = this;
            this.fetchData(false, (settings) => {
                if (!_this.isEmptyData(settings))
                    _this.settingsByGroup = settings;
            });


            this.httpReq({
                url : this.urlGenerate('api/required-data', false, {roles: true}),
                callback : function (response) {
                    _this.$set(_this.settingSelects, 'default_user_role', response.data.result.roles);
                    _this.$set(_this.settingSelects, 'default_course_status', [
                        {name : 'Inactive', id : '0'},
                        {name : 'Active', id : '1'},
                        {name : 'Pending', id : '2'}
                    ]);
                }
            });
        },

        methods: {
            saveSettings() {
                const _this = this;
                this.httpReq({
                    customUrl: 'api/settings/update-all',
                    method: 'post',
                    data:this.settingsByGroup,
                    callback: (response) => {
                        _this.showToast(response.data.message);
                        if (response.data) _this.$store.commit('setSettings', response.data.result);
                    }
                })
            },
        }
    }
</script>

<style scoped>
    .section-title {
        background-color: #f7f7f7;
        padding: 10px;
        font-weight: bold;
        border: 1px solid #dee2e6;
        text-transform: capitalize;
    }
    .file-upload-wrapper {
        border: 1px dashed #ddd;
        padding: 20px;
        text-align: center;
    }
    .file-upload-wrapper img {
        max-width: 100px;
    }
    .form-section {
        margin-bottom: 30px;
    }
    .btn-upload {
        padding: 8px 12px;
        font-size: 16px;
        max-width: 100%;
    }
</style>