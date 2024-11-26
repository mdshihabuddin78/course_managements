<template>
    <!-- Modal -->
    <div class="modal fade" id="backendModal" tabindex="-1" aria-labelledby="backendModalLabel" aria-hidden="true">
        <div class="modal-dialog" :style="{maxWidth: windowWidth >= 700 ? this.width : '90%', /*90% for small screens*/}">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="backendModalLabel">{{ title }}</h1>
                    <button type="button" class="close" @click="closeModal('#backendModal', clearSpanErrors, initVal)" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form role="form" @submit.prevent="handleSubmit" enctype="multipart/form-data">
                    <div class="modal-body">
                        <slot/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="closeModal('#backendModal', clearSpanErrors, initVal)">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "validateFormModal",
        data() {
            return {
                windowWidth: window.innerWidth,
                errorFields: [], // Will store error elements for removal after validation
            };
        },
        props: {
            title: String,
            width: {
                type: String,
                default: '500px',
            },
            initVal: {
                type: Object,
                default: () => ({ }),
            },
            currentPage: Number,
        },

        watch: {
            // Watches for changes in validation errors and triggers custom handler
            '$validator.errors.items': {
                handler(newErrors) {
                    // Remove any previously added error spans from the UI
                    this.clearSpanErrors();

                    // Show the newErrors on the UI
                    newErrors.forEach(item => {
                        const element = document.querySelector(`[name="${item.field}"]`);
                        element.classList.add('is-invalid');  // Highlight the field as invalid

                        // Create a new span element for the error message
                        const errorSpan = document.createElement('span');
                        errorSpan.className = 'text-danger';
                        errorSpan.textContent = item.msg;

                        // Append the new error message to the parent node of the input field
                        element.parentNode.appendChild(errorSpan);

                        // Store the input element and its corresponding error span for later removal
                        this.errorFields.push({ 'input': element, 'span': errorSpan });
                    });
                },
                deep: true // Ensure deep watching for nested changes
            }
        },

        mounted() {
            $('#backendModal').on('hidden.bs.modal', () => {
                this.closeModal('#backendModal', this.clearSpanErrors, this.initVal);
            });
        },

        methods: {
            /**
             * Handles the form submission, triggers validation before emitting an event.
             */
            handleSubmit() {
                const _this = this;

                try {
                    let items = this.$validator.errors.items;
                    if (Object.keys(items).length > 0) {
                        alert('Please fix the errors before submitting.');
                        return
                    }

                    // Handle form submission
                    let urlSuffix = this.formData.id ?? false;
                    let method = this.formData.id ? 'put' : 'post';

                    this.httpReq({
                        urlSuffix: urlSuffix,
                        method: method,
                        callback: (response) => {
                            if (response.data) {
                                // Show success toast notification instead of alert
                                _this.showToast(response.data.message, response.data.status === _this.CODE_SUCCESS ? 'success' : 'error');
                                _this.fetchData(this.urlGenerate(false, false, {page: _this.currentPage, perPage: _this.perPage}));
                            }
                        }
                    });

                    this.closeModal();

                } catch (e) {
                    console.error(e);  // Log any errors encountered during validation
                }
            },

            // clears all error messages and invalid styles from the UI.
            clearSpanErrors() {
                const _this = this;
                _this.errorFields.forEach(({ input, span }, index) => {
                    input.classList.remove('is-invalid');  // Remove the invalid class
                    span.remove();  // Remove the error message span from the DOM
                    _this.errorFields.splice(index, 1);  // Remove the span from the stored array
                });
            },
        }
    };
</script>