export default {
    data() {
        return {
            // fetches: [], // hold all fetch infos / {} for fetch default datalist
        };
    },
    methods: {
        // prepare the form for updating an existing item.
        onClickUpdate(item) {
            let copy = Object.assign({}, item); // to avoid reference
            this.$store.commit('setFormData', copy);
            this.openModal();
        },

        // handle the deletion of an item
        deleteItem(id, currentPage, perPage, params = {}) {
            const _this = this;
            this.showSweetAlert({
                confirmButtonText: 'Yes, Delete it',
                cancelButtonText: 'No, Cancel it',
                callback: (conform) => {
                    if (conform) {
                        _this.httpReq({
                            urlSuffix: id,
                            method: 'delete',
                            callback: (response) => {
                                if (response.data) {
                                    // Show success toast notification for deletion
                                    _this.showToast(response.data.message, response.data.status === _this.CODE_SUCCESS ? "success" : "error");
                                    _this.fetchData(this.urlGenerate(false, false, { ...{page: currentPage, perPage}, ...params }));
                                }
                            }
                        });
                    }
                }
            });
        },



        // Validates a specific field when the user interacts with it
        async validateField(e, unique = false) {
            const field = e.target.name;
            if (field === 'title' && unique) {
                // Check for uniqueness by sending a request to the server
                await this.checkUniqueTitle();
            }
            this.$validator.validate(field);  // Validate the field using the validator
        },
        // checks if the 'title' field is unique by making a server request.
        async checkUniqueTitle() {
            try {
                this.httpReq({
                    urlSuffix: 'check/title',
                    method: 'post',
                    callback: (response) => {
                        if (!response.data.isUnique) {
                            // Title is not unique, add a custom error
                            if (!this.$validator.errors.has('title')) {
                                this.$validator.errors.add({
                                    field: 'title',
                                    msg: 'The title must be unique.',
                                    rule: 'unique'
                                });
                            }
                        }
                    }
                });
            } catch (error) {
                console.error('Error checking title uniqueness:', error);
            }
        },
    }
}
