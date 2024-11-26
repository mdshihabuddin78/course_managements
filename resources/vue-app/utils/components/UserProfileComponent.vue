<template>
    <div class="container mt-5">
        <div class="row">
            <!-- Profile Card -->
            <div class="col-md-4">
                <div class="card profile-card">
                    <div class="mb-3">
                        <div class="upload-area d-block m-auto">
                            <div>
                                <i @click="() => {$refs.fileInput.click()}" class="fas fa-edit text-white p-1 edit-icon" title="Upload"></i>
                                <i v-if="user.avatar" @click="updateUser(DELETE_AVATAR)" class="fas fa-trash text-white p-1 delete-icon" title="Delete"></i>
                            </div>
                            <img :src="generateFileUrl(avatarFormData.avatar ? avatarFormData.avatar : user.avatar, TYPE_USER)" alt="Preview" class="preview-img mx-auto p-1" :style="{backgroundColor: btnBg}"/>
                        </div>
                        <input type="file" ref="fileInput" @change="handleFileUpload($event, 'avatar', avatarFormData)" class="file-input" accept="image/*"/>
                        <div  v-if="avatarFormData.avatar && avatarFormData.avatar.success" class="mt-1">
                            <button @click="updateUser(UPDATE_AVATAR)" class="btn btn-primary" :style="{ backgroundColor: btnBg}" title="Confirm Upload"><i class="fas fa-upload"></i></button>
                            <button class="btn btn-danger" title="Cancel Upload">X</button>
                        </div>
                    </div>

                    <h4 class="mb-0">{{ user.name }}</h4>
                    <p class="text-muted">{{ user.role ? user.role.name : '' }}</p>
                    <p>{{ user.bio }}</p>
                </div>
                <div class="card px-3">
                    <ul class="list-unstyled social-links mb-0">
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fas fa-envelope text-primary"></i> Email: </span>
                            <a :href="'mailto:' + user.email" class="text-decoration-none text-dark font-weight-bold text-right">{{ user.email }}</a>
                        </li>
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fas fa-mobile-alt text-primary"></i> Mobile:</span>
                            <a :href="'tel:' + user.mobile" class="text-decoration-none text-dark font-weight-bold text-right">{{ user.mobile }}</a>
                        </li>
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fas fa-globe text-primary"></i> Website:</span>
                            <a :href="user.website" class="text-decoration-none text-dark font-weight-bold text-right">{{ user.website }}</a>
                        </li>
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fab fa-github text-primary"></i> Github:</span>
                            <a :href="user.github" class="text-decoration-none text-dark font-weight-bold text-right">{{ user.github }}</a>
                        </li>
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fas fa-birthday-cake text-primary"></i> Birth:</span>
                            <a class="text-decoration-none text-dark font-weight-bold text-right">{{ user.date_of_birth }}</a>
                        </li>
                        <li class="py-2 d-flex justify-content-between border-bottom">
                            <span><i class="fas fa-location-arrow text-primary"></i> Location:</span>
                            <a class="text-decoration-none text-dark font-weight-bold text-right">{{ user.location }}</a>
                        </li>
                    </ul>
                </div>

                <div class="card px-3">
                    <div class="p-2">
                        <h4 class="text-danger">Danger Zone</h4>
                        <p class="mb-1"><strong>Delete this account?</strong></p>
                        <p class="danger-description">
                            Once you delete an account, there is no going back. Please be certain.
                        </p>
                        <button @click="deleteAccount" class="btn btn-outline-danger btn-fw">Delete my account</button>
                    </div>
                </div>
            </div>

            <!-- User Info -->
            <div class="col-md-8">
                <div class="card p-3">
                    <form @submit.prevent="updateUser(UPDATE_INFO)">
                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="fullName" class="mr-3" style="width: 150px;">Name</label>
                            <input type="text" v-model="formData.name" class="form-control" id="fullName">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="bio" class="mr-3" style="width: 150px;">Bio</label>
                            <textarea v-model="formData.bio" class="form-control" id="bio">{{formData.bio}}</textarea>
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="email" class="mr-3" style="width: 150px;">Email</label>
                            <input type="email" v-model="formData.email" class="form-control" id="email">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="phone" class="mr-3" style="width: 150px;">Mobile</label>
                            <input type="tel" v-model="formData.mobile" class="form-control" id="phone">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="website" class="mr-3" style="width: 150px;">Website</label>
                            <input type="url" v-model="formData.website" class="form-control" id="website">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="github" class="mr-3" style="width: 150px;">Github</label>
                            <input type="url" v-model="formData.github" class="form-control" id="github">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="birth" class="mr-3" style="width: 150px;">Birth</label>
                            <input type="date" v-model="formData.date_of_birth" class="form-control" id="birth">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="address" class="mr-3" style="width: 150px;">Location</label>
                            <input type="text" v-model="formData.location" class="form-control" id="address">
                        </div>

                        <button type="submit" class="btn btn-primary w-100" title="Update Information" :style="{ backgroundColor: btnBg}">Update</button>
                    </form>
                </div>

                <div class="card p-3">
                    <h4>Reset Password</h4>
                    <form @submit.prevent="updateUser(RESET_PASSWORD)">
                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="password" class="mr-3" style="width: 150px;">Current</label>
                            <input type="password" v-model="resetFormData.current_password" class="form-control" id="password">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="password-new" class="mr-3" style="width: 150px;">Set New</label>
                            <input type="password" v-model="resetFormData.new_password" class="form-control" id="password-new">
                        </div>

                        <div class="form-group d-flex align-items-center mb-3">
                            <label for="password-conform" class="mr-3" style="width: 150px;">Conform New</label>
                            <input type="password" v-model="resetFormData.new_password_confirmation" class="form-control" id="password-conform">
                        </div>

                        <button type="submit" class="btn btn-primary w-100" title="Reset Password" :style="{ backgroundColor: btnBg}">Reset</button>
                    </form>
                </div>

                <slot />

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "UserProfileComponent",

        data() {
            return {
                user: {},
                avatarFormData: {},
                resetFormData: {},
                UPDATE_AVATAR: 1,
                DELETE_AVATAR: 11,
                DELETE_USER : 22,
                UPDATE_INFO: 2,
                RESET_PASSWORD: 3,
            }
        },

        mounted() {
            this.user = this.auth;

            let copy = Object.assign({}, this.user); // to avoid reference
            this.$store.commit('setFormData', copy);
        },
        props: {
            btnBg: {
                type: String,
                default: '#3f50f6',
            },
        },

        methods: {
            updateUser(type) {
                let urlSuffix = this.user.id;
                let method = 'put';
                let data = false;

                switch (type) {
                    case this.UPDATE_AVATAR:
                        this.avatarFormData.avatar_id = this.user.avatar_id;
                        data = this.avatarFormData;
                        break;
                    case this.DELETE_AVATAR:
                        urlSuffix = 'avatar-delete';
                        method = 'post';
                        data = {id: this.user.id, avatar_id: this.user.avatar_id};
                        break;
                    case this.DELETE_USER:
                        method = 'delete';
                        data = {};
                        break;
                    case this.RESET_PASSWORD:
                        urlSuffix = 'password-reset';
                        method = 'post';
                        data = this.resetFormData;
                        break;
                }


                const _this = this;
                this.httpReq({
                    urlSuffix,
                    method,
                    data,
                    callback: (response) => {
                        if (response.data) {
                            _this.showToast(response.data.message, response.data.status === _this.CODE_SUCCESS ? 'success' : 'error');
                            if (type === _this.RESET_PASSWORD) {
                                if (response.data.status === _this.CODE_SUCCESS) _this.resetFormData = {};
                                return;
                            }

                            _this.user = response.data.result;

                            if (response.data.status === _this.CODE_SUCCESS && type === _this.RESET_PASSWORD) _this.resetFormData = {};

                            // reset auth from store
                            _this.$store.commit('setAuth', type !== _this.DELETE_USER &&_this.user ? _this.user : {});

                            _this.fetchData(_this.urlGenerate('required-data', false, {auth: true}), (result) => {
                                _this.$store.commit('setAuth', result.auth);
                            })
                        }

                        if (type === _this.UPDATE_AVATAR) _this.avatarFormData = {};
                    }
                });
            },

            deleteAccount() {
                const _this = this;

                this.showSweetAlert({
                    confirmButtonText: 'Delete Account',
                    cancelButtonText: 'Cancel',
                    callback: (conform) => {
                        if (conform) {
                            _this.updateUser(_this.DELETE_USER);
                            window.location.href = '/';
                        }
                    }
                });
            }
        },
    }
</script>

<style scoped>
    .card {
        border-radius: 10px;
        margin-bottom: 20px;
    }
    .profile-card {
        text-align: center;
        padding: 30px;
    }
    .profile-card img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
    }
    .social-links li span {
        min-width: 100px;
    }
    .social-links a {
        margin-right: 15px;
        font-size: 12px;
        color: #333;
    }
    
    .upload-area {
        position: relative;
    }
    .upload-area div {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .upload-area div i {
        background-color: rgba(0, 0, 0, 0.47);
        cursor: pointer;
    }
    .preview-img {
        max-width: 100%;
        max-height: 100%;
    }
    .file-input {
        display: none;
    }
</style>